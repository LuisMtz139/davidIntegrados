import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/address/presentation/getX/get_event.dart';
import 'package:sazzon/feature/address/presentation/getX/get_state.dart';
import 'package:sazzon/feature/address/presentation/getX/getcontroller.dart';
import 'package:sazzon/feature/address/domain/entities/address.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';
import 'package:sazzon/feature/address/presentation/direccion_registro_direccion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/address/domain/entities/address.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';
import 'package:sazzon/feature/address/presentation/direccion_registro_direccion.dart';

class DireccionNoEncontrada extends StatelessWidget {
  final GetAddressController controller = Get.find<GetAddressController>();
  DireccionNoEncontrada({super.key});

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Agregar Dirección"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DireccionRegistroDireccion()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (controller.state.value is AddressLoading) {
                return CircularProgressIndicator();
              } else if (controller.state.value is PostsLoaded) {
                final posts = (controller.state.value as PostsLoaded).posts;
                return Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final address = posts[index];
                      return ListTile(
                        title: Text('${address.postcode} - ${address.calle} - ${address.colonia}'),
                      );
                    },
                  ),
                );
              } else if (controller.state.value is AddressFetchingFailure) {
                final error = (controller.state.value as AddressFetchingFailure).error;
                return Text('Error: $error');
              } else {
                return Text("No hay ninguna dirección registrada.");
              }
            }),
          ],
        ),
      ),
    );
  }
}
