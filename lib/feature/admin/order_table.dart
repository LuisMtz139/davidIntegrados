import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderTable extends StatefulWidget {
  const OrderTable({super.key});

  @override
  State<OrderTable> createState() => _OrderTableState();
}

class _OrderTableState extends State<OrderTable> {
  void showOrder() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return  const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Detalles del pedido",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Informacion de Cliente",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Nombre del cliente: 'Fulanito mendez mendez'"),
                    Text(
                        "Direccion de entrega: 'Av. 4, mzn G, lote 6, col. Capulines 1'"),
                    Text("Numero de telefono: '961-000-0000'"),
                    SizedBox(height: 20),
                    Text(
                      "Informacion de pedido",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("ID_pedido: \t\t\t\t\t'#1'"),
                    Text("Fecha:\t\t\t\t\t\t '29/06/2024'"),
                    SizedBox(height: 20),
                    Text(
                      "Articulos pedidos",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text("Desayunos: "),
                    Text("\t\t\t1. Platillo: 'Pancakes' "),
                    Text("\t\t\t\t • Cantidad: '2' "),
                    Text("\t\t\t\t • Precio unitario: '\$40.00' "),
                    Text("\t\t\t\t • Total: '\$80' "),
                    SizedBox(height: 10),
                    Text(
                      "Resumen del pedido",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Total: '\$80.00'"),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: DataTable(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black), // Color de las líneas de la tabla
            ),
            columnSpacing: 30, // Espacio entre las columnas
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Gestion',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'de Pedidos',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  '',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('ID')),
                  DataCell(Text('Cliente')),
                  DataCell(Text('Fecha')),
                  DataCell(Text('Direccion')),
                  DataCell(Text('Pedidos')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Sarah')),
                  DataCell(Text('28/06/2024')),
                  DataCell(
                    SizedBox(
                      width: 150, // Ancho máximo disponible para el texto
                      child: Text(
                        'av. cualquiera calle: cualquieras',
                        softWrap:
                            true, // Permitir salto de línea automáticamente
                        style: TextStyle(
                            fontSize:
                                14), // Ajusta el tamaño de fuente según sea necesario
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: IconButton(
                        icon: Icon(Icons.search), // Icono del botón
                        onPressed: () {
                          showOrder();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('Janine')),
                  DataCell(Text('28/06/2024')),
                  DataCell(
                    SizedBox(
                      width: 150, // Ancho máximo disponible para el texto
                      child: Text(
                        'av. cualquiera calle: cualquieras',
                        softWrap:
                            true, // Permitir salto de línea automáticamente
                        style: TextStyle(
                            fontSize:
                                14), // Ajusta el tamaño de fuente según sea necesario
                      ),
                    ),
                  ),
                  DataCell(Text(' ')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('William')),
                  DataCell(Text('28/06/2024')),
                  DataCell(
                    SizedBox(
                      width: 150, // Ancho máximo disponible para el texto
                      child: Text(
                        'av. cualquiera calle: cualquieras',
                        softWrap:
                            true, // Permitir salto de línea automáticamente
                        style: TextStyle(
                            fontSize:
                                14), // Ajusta el tamaño de fuente según sea necesario
                      ),
                    ),
                  ),
                  DataCell(Text(' ')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
