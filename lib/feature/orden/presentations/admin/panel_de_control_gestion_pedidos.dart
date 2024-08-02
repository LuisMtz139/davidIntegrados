  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:sazzon/feature/menu/presentation/bar_menu.dart';
  import 'package:sazzon/feature/orden/domain/usecase/get_orden_usecase.dart';
  import 'package:sazzon/feature/orden/data/models/orden_models.dart';

  import '../../../Platillos/presentations/admin/panel_de_control_gestion_de_pltillos.dart';
import '../../../user/presentation/pages/admin/panel_control_gestion_clientes.dart';
import '../../getOrder/get_state.dart';
  import '../../getOrder/getcontroller.dart';

  class PanelControlGestionPedidos extends StatefulWidget {
    const PanelControlGestionPedidos({super.key});

    @override
    State<PanelControlGestionPedidos> createState() => _WeAreState();
  }

  class _WeAreState extends State<PanelControlGestionPedidos> {
    final GetOrdenController _controller = Get.find<GetOrdenController>();
    int contador = 0;
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
              Obx(() {
                if (_controller.state.value is ordenLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (_controller.state.value is PostsLoaded) {
                  var posts = (_controller.state.value as PostsLoaded).posts;
                  return _buildPedidosTable(posts);
                } else if (_controller.state.value is ordenFetchingFailure) {
                  var error =
                      (_controller.state.value as ordenFetchingFailure).error;
                  return Center(child: Text('Error: $error'));
                } else {
                  return Container();
                }
              }),
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
    Widget _buildPedidosTable(List<OrdenModel> posts) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: const Text(
              'Gestión de pedidos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded( // Aquí agregamos el Expanded para que la tabla ocupe el espacio disponible
            child: SingleChildScrollView(
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(3),
                  4: FlexColumnWidth(1),
                },
                border: TableBorder.all(color: Colors.grey[300]!),
                children: [
                  _buildTableHeader(),
                  ...posts.map((post) => _buildPedidoRow( (contador++).toString(), post.user.email, post.address.calle, Icons.visibility,post)).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

    TableRow _buildTableHeader() {
      return TableRow(
        decoration: BoxDecoration(color: Colors.grey[100]),
        children: ['ID', 'Cliente', 'Dirección', 'Ver']
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

    TableRow _buildPedidoRow(
        String id, String cliente, String direccion, IconData icon,OrdenModel posts) {
      return TableRow(
        children: [
          _buildCell(id, TextAlign.center),
          _buildCell(cliente, TextAlign.left),
          _buildCell(direccion, TextAlign.left),
          TableCell(
            child: IconButton(
              icon: Icon(icon, size: 20),
              onPressed: () {
                _showPedidoDetails(context, posts);
              },
            ),
          ),
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
void _showPedidoDetails(BuildContext context,OrdenModel posts) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: const BoxDecoration(
          color: Color(0xFFBDCEA1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView( // Aquí agregamos el SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Detalles del pedido',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoSection('Información del cliente', [
                      'Nombre: '+posts.user.name,
                      'Dirección '+posts.address.calle+' '+posts.address.ciudad+' '+posts.address.colonia,
                      'Número de celular: '+posts.user.phone,
                      'email : '+posts.user.email,
                    ]),
                    const SizedBox(height: 16),
                    /*_buildInfoSection('Información del pedido', [
                      'ID_Pedido: 41',
                    ]),*/
                    const SizedBox(height: 16),
                    _buildArticulosPedidos( posts),
                    const SizedBox(height: 16),
                    _buildResumenPedido(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

    Widget _buildInfoSection(String title, List<String> items) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ...items.map((item) => Text(item)),
        ],
      );
    }

    Widget _buildArticulosPedidos(OrdenModel posts) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Artículos pedidos',
              style: TextStyle(fontWeight: FontWeight.bold)),
          _buildCategoriaArticulos('Desayunos', [
            {'nombre':  posts.platillos.nombre, 'cantidad': 2, 'precio': posts.platillos.precio},
          ]),
         
        ],
      );
    }

    Widget _buildCategoriaArticulos(
        String categoria, List<Map<String, dynamic>> articulos) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(categoria, style: const TextStyle(fontWeight: FontWeight.bold)),
          ...articulos.map((articulo) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${articulo['nombre']}:'),
                  Text('- Cantidad: ${articulo['cantidad']}'),
                  Text(
                      '- Precio unitario: \$${articulo['precio'].toStringAsFixed(2)}'),
                  Text(
                      '- Subtotal: \$${(articulo['cantidad'] * articulo['precio']).toStringAsFixed(2)}'),
                ],
              )),
        ],
      );
    }

    Widget _buildResumenPedido() {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Resumen del Pedido',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Total: \$320.00'),
        ],
      );
    }
  }
