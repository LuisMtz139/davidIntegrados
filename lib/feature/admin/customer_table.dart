import 'package:flutter/material.dart';

class TableClient extends StatefulWidget {
  const TableClient({super.key});

  @override
  State<TableClient> createState() => _TableClientState();
}

class _TableClientState extends State<TableClient> {
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
                  'de Usuarios',
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
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('ID')),
                  DataCell(Text('Nombre')),
                  DataCell(Text('Telefono')),
                  DataCell(Text('Correo')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Sarah')),
                  DataCell(Text('961-000-0000')),
                  DataCell(Text('correo@gmail.com')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('Janine')),
                  DataCell(Text('961-000-0000')),
                  DataCell(Text('correo@gmail.com')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('William')),
                  DataCell(Text('961-000-0000')),
                  DataCell(Text('correo@gmail.com')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
