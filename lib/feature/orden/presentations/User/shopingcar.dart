import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sazzon/feature/address/presentation/direccion_no_encontrada.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../menu/presentation/bar_menu.dart';

class Platillo {
  final String id;
  final String nombre;
  final double precio;
  final int cantidad;
  final int orderId;

  Platillo({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.orderId,
  });

  factory Platillo.fromJson(
      Map<String, dynamic> json, int cantidad, int orderId) {
    return Platillo(
      id: json['id'] ?? '',
      nombre: json['nombre'] ?? '',
      precio: (json['precio'] ?? 0).toDouble(),
      cantidad: cantidad,
      orderId: orderId,
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  late Future<List<Platillo>> platillos;
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    platillos = fetchPlatillos();
  }

  Future<List<Platillo>> fetchPlatillos() async {
    print("Iniciando fetchPlatillos");
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final response = await http
        .get(Uri.parse('https://orders.sazzon.site/orders/users/$userId'));

    if (response.statusCode == 200) {
      try {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<Platillo> platillosList = [];
        double totalTemp = 0.0;

        for (var order in jsonResponse) {
          var orderId = order['id'];
          var platillos = order['platillos'];
          var quantities = order['quantities'];
          for (int i = 0; i < platillos.length; i++) {
            var platillo =
                Platillo.fromJson(platillos[i], quantities[i], orderId);
            platillosList.add(platillo);

            totalTemp += platillo.precio;

            print(
                'Platillo ID: ${platillo.id}, Nombre: ${platillo.nombre}, Precio: \$${platillo.precio.toStringAsFixed(2)}, Cantidad: ${platillo.cantidad}');
          }
        }

        print(
            'Suma total de precios de los platillos: \$${totalTemp.toStringAsFixed(2)}');

        setState(() {
          total = totalTemp;
        });
        return platillosList;
      } catch (e) {
        print('Error parsing JSON: $e');
        return []; // Retorna una lista vacía en caso de error
      }
    } else {
      print('No se encontraron platillos');
      return []; // Retorna una lista vacía si no hay platillos
    }
  }

  Future<void> deletePlatillo(String orderId) async {
    try {
      final response = await http
          .delete(Uri.parse('https://orders.sazzon.site/orders/$orderId'));

      if (response.statusCode == 200) {
        // Recarga los platillos y actualiza el total
        List<Platillo> updatedPlatillos = await fetchPlatillos();
        setState(() {
          platillos = Future.value(updatedPlatillos);
          // Calcula el nuevo total sumando solo los precios
          total = updatedPlatillos.fold(
              0, (sum, platillo) => sum + platillo.precio);
        });

        // Muestra un mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Platillo eliminado correctamente')),
        );
      } else {
        throw Exception('Failed to delete order: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting order: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'No se pudo eliminar el platillo. Por favor, intente de nuevo.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Platillo>>(
                future: platillos,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                        child: Text('No hay platillos en el carrito'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].nombre,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('\$${snapshot.data![index].precio}',
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange,
                                  ),
                                  child: Text(
                                    '${snapshot.data![index].cantidad}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.black),
                                  onPressed: () {
                                    deletePlatillo(snapshot.data![index].orderId
                                        .toString());
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 102, 0),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DireccionNoEncontrada()),
                );
              },
              child: Text(
                'Finalizar pedido',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
