import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/menu/presentation/Menu/getMenuCOntroller.dart';
import 'package:sazzon/feature/menu/presentation/Menu/getMenu_state.dart';
import 'package:sazzon/feature/menu/presentation/menu.dart';
import 'package:sazzon/feature/we_are/presentation/we_are.dart';

class BarMenu extends StatefulWidget {
  const BarMenu({super.key});

  @override
  State<BarMenu> createState() => _BarMenuState();
}

class _BarMenuState extends State<BarMenu> {
    late final GetMenuController getMenuController;

  void screenWeare(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WeAre()),
    );
  }
  void screenMenu(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Menu()),
    );
  }
 @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 400,
      margin: const EdgeInsets.only(top: 10, bottom: 225),
      width: 250,
      child: SizedBox(
        width: 200,
        height: 200,
      
        child: Drawer(
          child: Stack(
            
            children: <Widget>[
              // Imagen de fondo
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
              Transform.rotate(
                angle: 110 * (0.14159265359 / 180),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/tree.png'),
                      fit: BoxFit.contain, // Ajusta el fit según sea necesario
                    ),
                  ),
                  child: Image.asset(
                    'assets/tree.png',
                    width: 1900, // Ancho deseado para la imagen
                    // height: 386,
                    fit: BoxFit
                        .scaleDown, // Asegura que la imagen se ajuste dentro del Container
                  ),
                ),
              ),

              // Contenido del Drawer
              ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    title: const Text('Menú',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      screenMenu(context);
                      // Aquí puedes añadir cualquier acción al seleccionar 'Configuración'
                    },
                  ),
                  const Divider(color: Color(0xFFF6532A)),
                  ListTile(
                    title: const Text(
                      '¿Quiénes somos?',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      screenWeare(context);
                      // Aquí puedes añadir cualquier acción al seleccionar '¿Quiénes somos?'
                    },
                  ),
                  const Divider(color: Color(0xFFF6532A)),
                  ListTile(
                    title: const Text(
                      '¿Cómo funciona?',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      // Aquí puedes añadir cualquier acción al seleccionar '¿Cómo funciona?'
                    },
                  ),
                  const Divider(color: Color(0xFFF6532A)),
                  ListTile(
                    title: const Text(
                      'Preguntas\nfrecuentes',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      // Aquí puedes añadir cualquier acción al seleccionar 'Preguntas frecuentes'
                    },
                  ),
                  const Divider(color: Color(0xFFF6532A)),
                  ListTile(
                    title: const Text(
                      'Perfil',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      // Aquí puedes añadir cualquier acción al seleccionar 'Perfil'
                    },
                  ),
                  const Divider(color: Color(0xFFF6532A)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
