import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/address/presentation/getX/get_event.dart';
import 'package:sazzon/feature/address/presentation/getX/get_state.dart';
import 'package:sazzon/feature/address/presentation/getX/getcontroller.dart';
import 'package:sazzon/feature/address/domain/entities/address.dart';
import 'package:sazzon/feature/address/presentation/direccion_registro_direccion.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';
import 'package:sazzon/feature/menu/presentation/shoping/shopingcar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DireccionNoEncontrada extends StatelessWidget {
  final GetAddressController controller = Get.find<GetAddressController>();
  final RxInt selectedAddressIndex = (-1).obs;

  DireccionNoEncontrada({super.key});

  Future<void> _createOrder() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      final selectedAddressId = prefs.getString('selectedAddressId');

      print('userId: $userId');
      print('selectedAddressId: $selectedAddressId');

      Map<String, List> orderData = await getStoredOrderData();
      List<int> dishIds = orderData['ids'] as List<int>;
      List<double> quantities = orderData['prices'] as List<double>;

      print('dishIds: $dishIds');
      print('quantities: $quantities');

      Map<String, dynamic> body = {
        "userId": int.parse(userId ?? "0"),
        "directionId": int.parse(selectedAddressId ?? "0"),
        "dishIds": dishIds.map((id) => id.toString()).toList(),
        "quantities": quantities.map((q) => q.toInt()).toList(),
        "status": ""
      };

      print('Cuerpo de la solicitud:');
      print(jsonEncode(body));

      final response = await http.post(
        Uri.parse('https://orders.sazzon.site/orders'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      print('Código de estado de la respuesta: ${response.statusCode}');
      print('Respuesta del servidor:');
      print(response.body);

      if (response.statusCode == 200) {
        print('Orden creada exitosamente');
      } else {
        print('Error al crear la orden');
      }
    } catch (e) {
      print('Excepción capturada: $e');
    }
  }

  Future<Map<String, List>> getStoredOrderData() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedIds = prefs.getString('orderIds');
    String? storedPrices = prefs.getString('prices');

    List<int> ids = [];
    List<double> prices = [];

    if (storedIds != null && storedIds.isNotEmpty) {
      ids = storedIds.split(',').map((id) => int.parse(id)).toList();
    }

    if (storedPrices != null && storedPrices.isNotEmpty) {
      prices =
          storedPrices.split(',').map((price) => double.parse(price)).toList();
    }

    return {'ids': ids, 'prices': prices};
  }

  void _showPaymentModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
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
                        'Se te redirigirá a PayPal para completar los siguientes pasos de forma segura.',
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
                  print('Botón presionado');
                  await _createOrder();
                  print('Función _createOrder completada');
                  Navigator.pop(context);
                },
                child: Text('Continuar con PayPal'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        );
      },
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
                              onPressed: () {
                                _showPaymentModal(context);
                              },
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
