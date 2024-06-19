import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Agregado según lo solicitado

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: Color(0xFFBDCEA1),
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 160),
                Text(
                  'Ingresa tu nombre',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Center(
                  child: Container(
                    width: 320,
                    height: 50,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Nombre de usuario',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16), // Espacio adicional entre campos
                Text(
                  'Ingresa una contraseña',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Center(
                  child: Container(
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
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        8), // Espacio adicional entre campos y las condiciones
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 3),
                      Text(
                        '* Debe contener al menos 8 caracteres',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '* Debe contener al menos un número',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '* Debe contener al menos un carácter especial como #!+-=',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16), // Espacio adicional entre campos
                Text(
                  'Ingresa número telefónico',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Center(
                  child: Container(
                    width: 320,
                    height: 50,
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Número de teléfono',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16), // Espacio adicional entre campos
                Text(
                  'Ingresa un correo electrónico',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Center(
                  child: Container(
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
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 48),
                Spacer(),
              ],
            ),
          ),
          // Franja de color blanco en el lado izquierdo
          Positioned(
            top: 80,
            left: 0,
            bottom: 135,
            width: 60,
            child: Container(
              color: Colors.white,
            ),
          ),
          // Imagen de fondo debajo de los inputs
          Positioned(
            bottom: 88,
            left:
                1, // Mueve la caja hacia la izquierda para que parezca salir de la pantalla
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Text(
                      'SEZZON',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 1), // Ajusta el espacio según sea necesario
                Image.asset(
                  'assets/images/platano.png',
                  width: 230,
                  height: 150,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 45,
            right: -30,
            child: ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String password = passwordController.text;
                String phone = phoneController.text;
                String email = emailController.text;
                print('Nombre: $name');
                print('Contraseña: $password');
                print('Teléfono: $phone');
                print('Correo electrónico: $email');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 110, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
              ),
              child: Text(
                'Registrate',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Positioned(
                top: 65,
                right: 250, // Ajusta para mover el contenedor
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  // El IconButton se ha movido fuera de este Container
                ),
              ),
              Positioned(
                top: 65, // Ajusta para mover la flecha
                right: 330, // Ajusta para mover la flecha
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: 55),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 0.5,
            left: 110, // Ajustado para mantener la separación original
            child: Image.asset(
              'assets/images/cebolla.png', // Replace with your image path
              width: 250,
              height: 190,
            ),
          ),
          Positioned(
            top: 0.5,
            right: -40, // Ajustado para mantener la separación original
            child: Image.asset(
              'assets/images/lechga.png', // Replace with your image path
              width: 200,
              height: 200,
            ),
          ),
          Positioned(
            top: 400, // Ajustado para mantener la separación original,
            right: -50, // Ajustado para mantener la separación original
            child: Image.asset(
              'assets/images/tomate.png', // Replace with your image path
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreen(),
    );
  }
}
