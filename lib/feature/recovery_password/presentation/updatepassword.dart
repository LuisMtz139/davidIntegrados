import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sazzon/feature/recovery_password/presentation/PasswordGetX/password_event.dart';
import 'package:sazzon/feature/user/data/models/user_models.dart';
import 'package:sazzon/feature/user/domain/entities/user.dart';
import 'package:sazzon/feature/user/presentation/Getx/RegisterUser/registerUserCOntroller.dart';
import 'package:sazzon/feature/user/presentation/Getx/RegisterUser/register_event.dart';
import 'package:sazzon/feature/user/presentation/pages/iniciarSeion.dart'; // Agregado según lo solicitado
import 'package:get/get.dart';

import '../../user/data/models/password_models.dart';
import 'PasswordGetX/registerUserCOntroller.dart';

class Updatepassword extends StatefulWidget {
  @override
  _Registro1State createState() => _Registro1State();
}

class _Registro1State extends State<Updatepassword> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final PasswordController _passwordController = Get.find<PasswordController>();

  Color minLengthColor = Colors.black;
  Color numberColor = Colors.black;
  Color specialCharColor = Colors.black;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    String password = passwordController.text;

    setState(() {
      minLengthColor = password.isEmpty
          ? Colors.black
          : (password.length >= 8 ? Colors.green : Colors.red);
      numberColor = password.isEmpty
          ? Colors.black
          : (password.contains(RegExp(r'\d')) ? Colors.green : Colors.red);
      specialCharColor = password.isEmpty
          ? Colors.black
          : (password.contains(RegExp(r'[#!\+\-=]'))
              ? Colors.green
              : Colors.red);
    });
  }

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

                SizedBox(height: 8),
                // Espacio adicional entre campos
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
                        hintText: '******',
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
                        '\u2022 Debe contener al menos 8 caracteres',
                        style: TextStyle(
                          color: minLengthColor,
                        ),
                      ),
                      Text(
                        '\u2022 Debe contener al menos un número',
                        style: TextStyle(
                          color: numberColor,
                        ),
                      ),
                      Text(
                        '\u2022 Debe contener al menos un carácter especial como #!+-=',
                        style: TextStyle(
                          color: specialCharColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 70, // Ajusta la posición según sea necesario
            right: 20, // Ajusta la posición según sea necesario
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Text(
                      'SEZZON',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 45,
              right: -30,
              child: ElevatedButton(
                onPressed: () {
                  String password = passwordController.text;
                  String _id = "5";

                  bool isValid = true;

                  if (password.length < 8) {
                    isValid = false;
                  }
                  if (!password.contains(RegExp(r'\d'))) {
                    isValid = false;
                  }
                  if (!password.contains(RegExp(r'[#!\+\-=]'))) {
                    isValid = false;
                  }

                  if (isValid) {
                    print('Contraseña: $password');
                    final _password =
                        PasswordModels(id: _id, password: password);
                    _passwordController
                        .createPasswrod(CreatepasswrodEvent(_password));
  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('correcto'),
                          content: Text(
                              'ha actualizado correctamente la informacion'),
                          actions: [
                            TextButton(
                              child: Text('Aceptar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    print('La contraseña no cumple con los requisitos');
                    // Muestra un mensaje de error o una alerta al usuario
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text(
                              'La contraseña no cumple con los requisitos.'),
                          actions: [
                            TextButton(
                              child: Text('Aceptar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
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
                  'actualizar contraseña',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )),
          Stack(
            children: <Widget>[
              Positioned(
                top: 68,
                right: 250, // Ajusta para mover el contenedor
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  // El IconButton se ha movido fuera de este Container
                ),
              ),
              Positioned(
                top: 65, // Ajusta para mover la flecha
                right: 330, // Ajusta para mover la flecha
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 55),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                top: 650,
                right: 305, // Ajustado para mantener la separación original
                child: Transform.rotate(
                  angle: 0, // Ajusta el ángulo de rotación según sea necesario
                  child: Image.asset(
                    'assets/images/platano.png', // Replace with your image path
                    width: 130,
                    height: 130,
                  ),
                ),
              ),
              Positioned(
                top: 350,
                right: 335, // Ajustado para mantener la separación original
                child: Transform.rotate(
                  angle: 1, // Ajusta el ángulo de rotación según sea necesario
                  child: Image.asset(
                    'assets/images/cebolla.png', // Replace with your image path
                    width: 130,
                    height: 130,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                right: 335, // Ajustado para mantener la separación original
                child: Transform.rotate(
                  angle: 1, // Ajusta el ángulo de rotación según sea necesario
                  child: Image.asset(
                    'assets/images/lechga.png', // Replace with your image path
                    width: 130,
                    height: 130,
                  ),
                ),
              ),
              Positioned(
                top: 500, // Ajustado para mantener la separación original,
                right: -50, // Ajustado para mantener la separación original
                child: Image.asset(
                  'assets/images/tomate.png', // Replace with your image path
                  width: 200,
                  height: 200,
                ),
              ),
              Positioned(
                top: 60, // Ajustado para mantener la separación original,
                right: -78, // Ajustado para mantener la separación original
                child: Image.asset(
                  'assets/images/nues.png', // Replace with your image path
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
