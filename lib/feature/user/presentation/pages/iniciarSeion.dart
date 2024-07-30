import 'package:flutter/material.dart';
import 'package:sazzon/feature/menu/presentation/menu.dart'; // Agregado según lo solicitado

class IniciarSesio extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  IniciarSesio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFBDCEA1),
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 450),
                const Text(
                  'Ingresa un correo electrónico',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Center(
                  child: SizedBox(
                    width: 320,
                    height: 50,
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Correo electrónico',
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Espacio adicional entre campos
                const Text(
                  'Ingresa una contraseña',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Center(
                  child: SizedBox(
                    width: 320,
                    height: 50,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '***********',
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                    height: 30), // Espacio adicional entre campos y el texto
                Center(
                  child: GestureDetector(
                    onTap: () {
                      print('Olvidé mi contraseña');
                    },
                    child: const Text(
                      '¡Olvidé mi contraseña!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 70, // Ajusta la posición según sea necesario
            right: 20, // Ajusta la posición según sea necesario
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: const Text(
                  'SEZZON',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 45,
            left: -30,
            child: ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;
                print('Correo electrónico: $email');
                print('Contraseña: $password');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Menu(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
              ),
              child: const Text(
                'Iniciar sesión',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Positioned(
                top: 68,
                right: 250, // Ajusta para mover el contenedor
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                top: 65, // Ajusta para mover la flecha
                right: 330, // Ajusta para mover la flecha
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 55),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                top: 300,
                right: 300, // Ajustado para mantener la separación original
                child: Transform.rotate(
                  angle: 1, // Ajusta el ángulo de rotación según sea necesario
                  child: Image.asset(
                    'assets/images/gerbera_rosa-removebg-preview.png', // Replace with your image path
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                right: 310, // Ajustado para mantener la separación original
                child: Transform.rotate(
                  angle: 1, // Ajusta el ángulo de rotación según sea necesario
                  child: Image.asset(
                    'assets/images/Gerbera-PNG-amarilla.png', // Replace with your image path
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Positioned(
                top: 140,
                left: 240, // Ajustado para mantener la separación original
                child: Transform.rotate(
                  angle: 0, // Ajusta el ángulo de rotación según sea necesario
                  child: Image.asset(
                    'assets/images/sarten.png', // Replace with your image path
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
              //agrega un texto que diga “Tripa vacía, corazón sin alegría”
              const Positioned(
                top: 240,
                right: 170, // Ajustado para mantener la separación original
                child: Text(
                  'Tripa vacía,\ncorazón sin \nalegría',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
