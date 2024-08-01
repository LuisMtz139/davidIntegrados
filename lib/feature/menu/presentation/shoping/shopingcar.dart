import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sazzon/feature/address/presentation/direccion_no_encontrada.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Platillo {
  final String nombre;
  final double precio;
  final int cantidad;
  final int orderId;

  Platillo({
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.orderId,
  });

  factory Platillo.fromJson(
      Map<String, dynamic> json, int cantidad, int orderId) {
    return Platillo(
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
    print("entreeeeeeeeeeeeeeeeeeee");
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final response = await http
        .get(Uri.parse('https://orders.sazzon.site/orders/users/$userId'));

    if (response.statusCode == 200) {
      try {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<Platillo> platillosList = [];
        double totalTemp = 0.0;
        List<int> orderIds = [];
        List<double> prices = [];

        for (var order in jsonResponse) {
          var orderId = order['id'];
          var platillos = order['platillos'];
          var quantities = order['quantities'];
          for (int i = 0; i < platillos.length; i++) {
            var platillo =
                Platillo.fromJson(platillos[i], quantities[i], orderId);
            platillosList.add(platillo);

            totalTemp += platillo.precio;

            if (!orderIds.contains(orderId)) {
              orderIds.add(orderId);
              prices.add(platillo.precio);
            }

            print(
                'Tarjeta ID: $orderId, Platillo: ${platillo.nombre}, Precio: \$${platillo.precio.toStringAsFixed(2)}');
          }
        }

        // Guardar la lista de IDs en SharedPreferences
        await prefs.setString('orderIds', orderIds.join(','));

        // Guardar la lista de precios en SharedPreferences
        await prefs.setString(
            'prices', prices.map((p) => p.toStringAsFixed(2)).join(','));

        print('Lista de IDs de las tarjetas: $orderIds');
        print('Lista de precios: $prices');
        print('IDs y precios guardados en SharedPreferences');

        print(
            'Suma total de precios de las tarjetas: \$${totalTemp.toStringAsFixed(2)}');

        setState(() {
          total = totalTemp;
        });
        return platillosList;
      } catch (e) {
        throw Exception('Error parsing JSON: $e');
      }
    } else {
      throw Exception('Sin platillos');
    }
  }

  Future<void> deletePlatillo(String id) async {
    final response =
        await http.delete(Uri.parse('https://orders.sazzon.site/orders/$id'));

    if (response.statusCode == 200) {
      setState(() {
        platillos = fetchPlatillos();
      });
    } else {
      print(
          'Failed to delete platillo: ${response.statusCode} ${response.body}');
      throw Exception('Failed to delete platillo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('SEZZON', style: TextStyle(fontSize: 20)),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
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
                    return Center(child: Text('No hay platillos disponibles'));
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
