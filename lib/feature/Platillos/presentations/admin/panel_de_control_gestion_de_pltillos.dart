import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/Platillos/GetX/delite_controller/deliteCOntroller.dart';
import 'package:sazzon/feature/menu/presentation/getX/posh_controller/registerCOntroller.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';
import 'package:file_picker/file_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../orden/presentations/admin/panel_de_control_gestion_pedidos.dart';
import '../../../user/presentation/pages/admin/panel_control_gestion_clientes.dart';
import '../../GetX/delite_controller/delite_event.dart';
import '../../../menu/presentation/getX/get_controller/get_event.dart';
import '../../../menu/presentation/getX/get_controller/get_state.dart';
import '../../../menu/presentation/getX/get_controller/getcontroller.dart';
import '../../../menu/presentation/getX/posh_controller/register_event.dart';
import '../../../menu/presentation/getX/posh_controller/register_state.dart';
import '../../data/models/platillos_models.dart';
import '../../domain/entities/patillos.dart';

class PanelDeControlGestionDePltillos extends StatefulWidget {
  const PanelDeControlGestionDePltillos({super.key});

  @override
  State<PanelDeControlGestionDePltillos> createState() => _WeAreState();
}

class _WeAreState extends State<PanelDeControlGestionDePltillos> {
  final GetPlatillosController _controller = Get.find<GetPlatillosController>();
  final CreatePlatillosController _createController =
      Get.find<CreatePlatillosController>();
  final DelitePlatillosController _controllerDelite =
      Get.find<DelitePlatillosController>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  String? _selectedCategoria;
  List<String> _selectedIngredientes = [];
  String? _imagenPath;
  int contador = 0;

  final List<MultiSelectItem<String>> _ingredientes = [
    MultiSelectItem('66ab235cd5754b87fe965fdf', 'Tomate'),
    MultiSelectItem('66ab2b9cd5754b87fe965fe7', 'Lechuga'),
  ];

  @override
  void initState() {
    super.initState();
    _controller.fetchPlatilloDetails(FetchPlatillosDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      drawer: const BarMenu(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "SEZZON",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Panel de control',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Icon(Icons.grid_view, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButton('Reportes', Icons.bar_chart, () {
                  // Acción para Reportes
                }),
                _buildButton('Clientes', Icons.people, () {
                  Get.to(() => PanelControlGestionClientes());
                }),
                _buildButton('Pedidos', Icons.receipt_long, () {
                  Get.to(() => PanelControlGestionPedidos());
                }),
                _buildButton('Platillos', Icons.restaurant_menu, () {
                  Get.to(() => PanelDeControlGestionDePltillos());
                }),
              ],
            ),
            const SizedBox(height: 26),
            Expanded(child: _buildPlatillosTable()),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    _showNewRecipeModal(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 24),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPlatillosTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Obx(() {
        if (_controller.state.value is platillosLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (_controller.state.value is PlatillosFetchingFailure) {
          return Center(
              child: Text(
                  (_controller.state.value as PlatillosFetchingFailure).error));
        } else if (_controller.state.value is PostsLoaded) {
          final platillos = (_controller.state.value as PostsLoaded).posts;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                ),
                child: const Text(
                  'Gestión de platillos',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(1),
                      4: FlexColumnWidth(1),
                    },
                    border: TableBorder.all(color: Colors.grey[300]!),
                    children: [
                      _buildTableHeader(),
                      ...platillos
                          .map((platillo) => _buildPlatilloRow(
                                platillo.id.toString(),
                                (contador++).toString(),
                                platillo.nombre_platillo.toString(),
                                platillo.categoria.toString(),
                               
                              ))
                          .toList(),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      }),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[100]),
      children: ['ID', 'Nombre', 'Categoría', ]
          .map((header) => TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    header,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ))
          .toList(),
    );
  }

  TableRow _buildPlatilloRow(String id, String contador, String nombre,
      String categoria,) {
    return TableRow(
      children: [
        _buildCell(contador, TextAlign.center),
        _buildCell(nombre, TextAlign.left),
        _buildCell(categoria, TextAlign.left),
      
      ],
    );
  }

  Widget _buildCell(String text, TextAlign align) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: align,
        ),
      ),
    );
  }

  void _showNewRecipeModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Nueva Receta',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(_nombreController, 'Nombre del platillo'),
                  const SizedBox(height: 10),
                  _buildDropdownField(
                      'Categoría', ['Desayuno', 'Comida', 'Cena']),
                  const SizedBox(height: 10),
                  _buildTextField(_descripcionController, 'Instrucciones',
                      maxLines: 3),
                  const SizedBox(height: 10),
                  _buildUploadButton('Subir imagen'),
                  const SizedBox(height: 10),
                  _buildTextField(_precioController, 'Precio'),
                  const SizedBox(height: 10),
                  _buildIngredientesField(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _guardarPlatillo,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: const Text('Guardar'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: const Text('Cancelar'),
                        ),
                      ),
                    ],
                  ),
                  Obx(() {
                    if (_createController.state.value is PlatillosLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (_createController.state.value
                        is PlatillosCreatedSuccessfully) {
                      _controller
                          .fetchPlatilloDetails(FetchPlatillosDetailsEvent());
                      return const Text('Platillo creado exitosamente');
                    } else if (_createController.state.value
                        is PlatillosCreationFailure) {
                      return Text(
                          'Error: ${(_createController.state.value as PlatillosCreationFailure).error}');
                    } else {
                      return Container();
                    }
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      maxLines: maxLines,
    );
  }

  Widget _buildDropdownField(String label, List<String> items) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: items.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        _selectedCategoria = value as String?;
      },
    );
  }

  Widget _buildIngredientesField() {
    return MultiSelectDialogField(
      items: _ingredientes,
      title: const Text("Ingredientes"),
      selectedColor: Colors.blue,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      buttonIcon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.grey,
      ),
      buttonText: const Text(
        "Seleccionar Ingredientes",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
      onConfirm: (results) {
        _selectedIngredientes = results.cast<String>();
      },
    );
  }

  Widget _buildUploadButton(String label) {
    return OutlinedButton.icon(
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          setState(() {
            _imagenPath = result.files.single.path;
          });
        }
      },
      icon: const Icon(Icons.upload),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
      ),
    );
  }

  void _guardarPlatillo() {
    final nombre = _nombreController.text;
    final descripcion = _descripcionController.text;
    final precio = int.tryParse(_precioController.text) ?? 0;
    final ingredientes = jsonEncode(_selectedIngredientes); // Convertir a JSON
    final categoria = _selectedCategoria ?? '';

    final platillo = PlatillosModel(
      nombre_platillo: nombre,
      descripcion: descripcion,
      precio: precio,
      categoria: categoria,
      imagen: _imagenPath ?? '',
      ingredientes: ingredientes,
    );

    _createController.createPlatillos(CreatePlatillosEvent(platillo)).then((_) {
      // Después de crear el platillo, recargar la tabla
      _controller.fetchPlatilloDetails(FetchPlatillosDetailsEvent());
    });
  }

  void _showDeleteConfirmationDialog(String id, String nombre) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ID _ $id',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('Nombre del platillo: $nombre'),
              const Text(
                  'Categoría: Comida'), // Asume que es comida, ajusta según necesites
              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  'assets/images/milanesa.jpg', // Asegúrate de tener esta imagen en tu proyecto
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '¿Deseas eliminar este platillo?',
                style: TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: () {
                    // Aquí va la lógica para eliminar el platillo
                    _controllerDelite.delitePlatillos(DelitePlatillosEvent(id));
                    _controller
                        .fetchPlatilloDetails(FetchPlatillosDetailsEvent());

                    //    createPostController.createUser(CreateUserEvent(post));

                    Navigator.of(context).pop();
                  },
                  child: const Text('Sí'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
