import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
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
          // Imagen de fondo debajo de los inputs
          Positioned(
            top: 400, // Ajusta la posición vertical según sea necesario
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.3, // Ajusta la opacidad según sea necesario
              child: Image.asset(
                'assets/images/lechga.png', // Reemplaza con la ruta de tu imagen de fondo
                fit: BoxFit.cover,
                height: 400, // Ajusta la altura según sea necesario
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            left: 30,
            child: Row(
              children: [
                Text(
                  'SEZZON',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 20),
                Image.asset(
                  'assets/images/platano.png',
                  width: 250,
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
          Positioned(
            top: 60,
            right: 340,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 55),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            top: 0.5,
            right: 80, // Ajustado para mantener la separación original
            child: Image.asset(
              'assets/images/cebolla.png', // Replace with your image path
              width: 270,
              height: 200,
            ),
          ),
          Positioned(
            top: 0.5,
            right: -68, // Ajustado para mantener la separación original
            child: Image.asset(
              'assets/images/tomate2.png', // Replace with your image path
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
