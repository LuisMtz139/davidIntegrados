import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/address/presentation/direccion_registro_direccion.dart';

import '../Getx/Login/postlogin_getx.dart';
/** */
class LoginPage1 extends StatelessWidget {
  final LoginController authController =
      Get.find<LoginController>();

  LoginPage1({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authController.login(
                    emailController.text, passwordController.text);
              },
              child: Obx(() => authController.isLoading.value
                  ? CircularProgressIndicator()
                  : Text('Login')),
            ),
            Obx(() {
              if (authController.isLoggedIn.value) {
                return Text(
                    'Login Successful! User ID: ${authController.userId.value}');
              } else if (authController.errorMessage.isNotEmpty) {
                return Text('Error: ${authController.errorMessage.value}');
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
