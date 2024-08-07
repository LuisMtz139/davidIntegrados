import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';
import '../../../../Platillos/presentations/admin/panel_de_control_gestion_de_pltillos.dart';
import '../../../../orden/presentations/admin/panel_de_control_gestion_pedidos.dart';
import '../../Getx/getOrder/get_event.dart';
import '../../Getx/getOrder/get_state.dart';
import '../../Getx/getOrder/getcontroller.dart';

class PanelControlGestionClientes extends StatefulWidget {
  const PanelControlGestionClientes({super.key});

  @override
  State<PanelControlGestionClientes> createState() => _WeAreState();
}

class _WeAreState extends State<PanelControlGestionClientes> {
  final GetUserController _controller = Get.find<GetUserController>();
  int contador = 0;

  @override
  void initState() {
    super.initState();
    _controller.fetchUserDetails(FetchuserDetailsEvent());
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
            Expanded(
              child: _buildClientTable(),
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


  Widget _buildClientTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Obx(() {
        if (_controller.state.value is userLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (_controller.state.value is userFetchingFailure) {
          return Center(child: Text((_controller.state.value as userFetchingFailure).error));
        } else if (_controller.state.value is PostsLoaded) {
          final users = (_controller.state.value as PostsLoaded).posts;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                ),
                child: const Text(
                  'Gestión de clientes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Table(
                    border: TableBorder(
                      horizontalInside: BorderSide(color: Colors.grey[300]!),
                    ),
                    children: [
                      _buildTableHeader(),
                      ...users.map((user) => _buildClientRow(
                          user.id.toString(), user.name, user.email, user.phone)).toList(),
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
      children: ['ID', 'Nombre', 'Correo', 'Número celular']
          .map((header) => TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    header,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ))
          .toList(),
    );
  }

  TableRow _buildClientRow(String id, String name, String email, String phone) {
    return TableRow(
      children: [id, name, email, phone]
          .map((cell) => TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(cell),
                ),
              ))
          .toList(),
    );
  }
}
