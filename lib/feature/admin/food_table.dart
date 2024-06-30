import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TableDishes extends StatefulWidget {
  const TableDishes({super.key});

  @override
  State<TableDishes> createState() => _TableDishesState();
}

class _TableDishesState extends State<TableDishes> {
  // modal delete food
  void deleteFood() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          "ID _1",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Text("Nombre del platillo: 'Milanesa'"),
                        const Text("Categoria: 'Comida'"),
                        const SizedBox(height: 20),
                        const Text(
                          "¿Desea eliminar este platillo?",
                          style: TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF6532A),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Column(
                            children: [
                              Text("Eliminar",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/pollo-removebg-preview.png'))),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // modal edit
  void edit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            // AlertDialog(
            content: Column(
          mainAxisSize: MainAxisSize.min, // Para limitar el tamaño vertical
          children: <Widget>[
            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Alineación a la derecha
              children: <Widget>[
                Text(
                  "Nueva Receta",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Nombre del platillo: "),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Nombre del platillo: "),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: 'Seleccionar', // Valor seleccionado inicialmente
                  onChanged: (String? newValue) {
                    // Acción cuando se selecciona un nuevo valor
                  },
                  items: <String>['Seleccionar', 'Desayuno', 'Comida', 'Cena']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Ingredientes: "),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.list_alt),
                SizedBox(
                  width: 10,
                ),
                Icon(Iconsax.trash)
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Instrucciones: "),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Subir imagen: "),

                // SizedBox()
                Icon(Iconsax.document_upload)
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Presio: \$"),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.sp,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF6532A),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0), // Ajustar la altura
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    'Guardar',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF6532A),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0), // Ajustar la altura
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ));
        // alignment: const Alignment(0.1, -0.6));
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
                  'de Platillos',
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
              const DataRow(
                cells: <DataCell>[
                  DataCell(Text('ID')),
                  DataCell(Text('Nombre')),
                  DataCell(Text('Categoria')),
                  DataCell(Text('Modificar')),
                  DataCell(Text('Eliminar')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Sarah')),
                  DataCell(Text('Comida')),
                  DataCell(
                    Center(
                      child: IconButton(
                        icon: Icon(Iconsax.edit), // Icono del botón
                        onPressed: () {
                          edit();
                        },
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: IconButton(
                        icon:Icon(Iconsax.trash),
                        onPressed: (){deleteFood();},
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('Janine')),
                  DataCell(Text('Comida')),
                  DataCell(Center(child: Icon(Iconsax.edit))),
                  DataCell(Center(child: Icon(Iconsax.trash))),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('William')),
                  DataCell(Text('Comida')),
                  DataCell(Center(child: Icon(Iconsax.edit))),
                  DataCell(Center(child: Icon(Iconsax.trash))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
