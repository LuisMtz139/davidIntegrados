import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/address/presentation/getX/get_event.dart';
import 'package:sazzon/feature/address/presentation/getX/get_state.dart';
import 'package:sazzon/feature/address/presentation/getX/getcontroller.dart';
import 'package:sazzon/feature/address/domain/entities/address.dart';
import 'package:sazzon/feature/address/presentation/direccion_registro_direccion.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';
import 'package:sazzon/feature/orden/presentations/User/shopingcar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'dart:convert';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class DireccionNoEncontrada extends StatelessWidget {
  final GetAddressController controller = Get.find<GetAddressController>();
  final RxInt selectedAddressIndex = (-1).obs;
  final RxBool isProcessingOrder = false.obs;

  DireccionNoEncontrada({super.key});

  void _showErrorSnackBar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: Duration(seconds: 5),
    );
  }

  Future<void> _processPayment(String orderId, int total) async {
    print("Iniciando _processPayment");
    late IOClient ioClient;
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');

      print("userId obtenido: $userId");

      if (userId == null) {
        print("Error: User ID no encontrado en el almacenamiento local");
        throw Exception('User ID not found in local storage');
      }

      Map<String, dynamic> paymentData = {
        "id_user": userId,
        "id_order": orderId,
        "total_order": total
      };

      print('Enviando solicitud de pago:');
      print(jsonEncode(paymentData));

      final httpClient = HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
      ioClient = IOClient(httpClient);

      print("Enviando solicitud HTTP para procesar pago");
      final response = await ioClient
          .post(
            Uri.parse('https://54.87.184.70/paymnet/'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(paymentData),
          )
          .timeout(Duration(seconds: 30));

      print("Respuesta completa del servidor de pago:");
      print("Código de estado: ${response.statusCode}");
      print("Cuerpo de la respuesta:");
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Pago procesado exitosamente');
        final responseData = jsonDecode(response.body);
        final urlPayment = responseData['url_payment'];

        if (urlPayment != null && urlPayment.isNotEmpty) {
          print('Intentando abrir URL: $urlPayment');
          final Uri url = Uri.parse(urlPayment);
          if (await canLaunchUrl(url)) {
            await launchUrl(
              url,
              mode: LaunchMode.externalApplication,
              webOnlyWindowName: '_blank',
            );
          } else {
            print('No se puede lanzar la URL: $urlPayment');
            throw 'No se pudo abrir $urlPayment';
          }
        } else {
          throw Exception(
              'URL de pago no encontrada en la respuesta del servidor');
        }
      } else {
        throw Exception(
            'Error al procesar el pago. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      print("Excepción capturada en _processPayment: $e");
      _showErrorSnackBar(
          'Ocurrió un error inesperado. Por favor, intenta de nuevo.');
    } finally {
      ioClient.close();
    }
  }

  Future<void> _createOrder() async {
    print("Iniciando _createOrder");
    if (isProcessingOrder.value) {
      print("La orden ya está siendo procesada");
      return;
    }

    try {
      print("Configurando isProcessingOrder a true");
      isProcessingOrder.value = true;

      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      final selectedAddressId = prefs.getString('selectedAddressId');

      print('userId: $userId');
      print('selectedAddressId: $selectedAddressId');

      String? storedIdPrecio = prefs.getString('platilloIdPrecio');
      List<String> idPrecioList = storedIdPrecio?.split(',') ?? [];

      List<String> dishIds = [];
      List<int> quantities = [];

      for (int i = 0; i < idPrecioList.length; i += 2) {
        dishIds.add(idPrecioList[i]);
        quantities.add(1);
      }

      print('dishIds: $dishIds');
      print('quantities: $quantities');

      Map<String, dynamic> body = {
        "userId": int.parse(userId ?? "0"),
        "directionId": int.parse(selectedAddressId ?? "0"),
        "dishIds": dishIds,
        "quantities": quantities,
        "status": ""
      };

      print('Cuerpo de la solicitud:');
      print(jsonEncode(body));

      print("Enviando solicitud HTTP para crear orden");
      final httpClient = HttpClient()
        ..badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
      final ioClient = IOClient(httpClient);

      final response = await ioClient.post(
        Uri.parse('https://orders.sazzon.site/orders'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      print("Respuesta recibida. Código de estado: ${response.statusCode}");
      print("Cuerpo de la respuesta: ${response.body}");

      if (response.statusCode == 201) {
        print('Orden creada exitosamente');
        print('Detalles de la orden:');
        print(response.body);

        final orderData = jsonDecode(response.body);
        final orderId = orderData['id'].toString();
        final total = orderData['total'] as int;

        await _processPayment(orderId, total);
      } else {
        print('Error al crear la orden');
        _showErrorSnackBar(
            'Hubo un problema al crear tu orden. Por favor, intenta de nuevo.');
      }
    } catch (e) {
      print("Excepción capturada en _createOrder: $e");
      _showErrorSnackBar(
          'Ocurrió un error inesperado. Por favor, intenta de nuevo.');
    } finally {
      print("Configurando isProcessingOrder a false");
      isProcessingOrder.value = false;
    }
  }

  void _showPaymentModal() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: Row(
                children: [
                  Icon(Icons.paypal, color: Colors.blue, size: 24),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Se te redirigirá a PayPal para completar tu pago de forma segura.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PayPal.svg/1200px-PayPal.svg.png',
              height: 50,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (!isProcessingOrder.value) {
                  Get.back(); // Cerrar el modal
                  await _createOrder();
                }
              },
              child: Text('Continuar con PayPal'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.fetchCoDetails(FetchAddressDetailsEvent("2"));

    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      drawer: const BarMenu(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            const Text(
              "SEZZON",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShoppingCartPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        if (controller.state.value is AddressLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.state.value is PostsLoaded) {
          final posts = (controller.state.value as PostsLoaded).posts;
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final address = posts[index];
                    return Obx(() => GestureDetector(
                          onTap: () async {
                            selectedAddressIndex.value = index;
                            print('Address ID: ${address.id}');

                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString(
                                'selectedAddressId', address.id.toString());
                            print(
                                'ID guardado en almacenamiento local: ${address.id}');
                          },
                          child: Card(
                            margin: EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: selectedAddressIndex.value == index
                                    ? Colors.orange
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.orange,
                                    size: 24,
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Enviar a domicilio',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(address.calle),
                                        Text(address.colonia),
                                        Text('CP: ${address.postcode}'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                  childCount: posts.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Obx(() => selectedAddressIndex.value != -1
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ElevatedButton(
                              onPressed: _showPaymentModal,
                              child: Text(
                                "Continuar compra",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(double.infinity, 60),
                              ),
                            ),
                          )
                        : SizedBox.shrink()),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DireccionRegistroDireccion()),
                          );
                        },
                        child: Text(
                          "Agregar Dirección",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(double.infinity, 60),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          );
        } else if (controller.state.value is AddressFetchingFailure) {
          final error =
              (controller.state.value as AddressFetchingFailure).error;
          return Center(child: Text('Error: $error'));
        } else {
          return Center(child: Text("No hay ninguna dirección registrada."));
        }
      }),
    );
  }
}
