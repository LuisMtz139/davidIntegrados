import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sazzon/feature/user/data/models/user_models.dart';
import 'package:http/http.dart' as http;
import 'package:sazzon/feature/user/presentation/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../orden/presentations/User/shopingcar.dart';
import '../../domain/entities/updatepassword.dart';
import '../models/password_models.dart';

abstract class UserApiDataSource {
  Future<void> registerUser(userModel userModel);

  Future<List<userModel>> getorders();

  Future<void> updateUser(userModel userModel);

  Future<void> updatepassword(PasswordModels passwordModels);
}

class UserApiDataSourceImp implements UserApiDataSource {
  final String _baseUrl = 'https://users.sazzon.site/api/v1';

  @override
  Future<void> registerUser(userModel) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/users'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': userModel.name,
          'phone': userModel.phone.toString(),
          'email': userModel.email,
          'password': userModel.password ?? '',
          'admin': userModel.admin,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('User registered successfully');
        print('Response body: ${response.body}');

        // Redirigir a la nueva vista
        Get.off(() => MyHomePage()); // O la vista que desees
      } else {
        print('Failed to register user. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to register user: ${response.body}');
      }
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<void> updateUser(userModel userModel) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl/users'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'name': userModel.name,
          'phone': userModel.phone,
          'email': userModel.email,
          'password': userModel.password ?? '',
          'admin': userModel.admin,
        }),
      );

      // Ahora que los datos se han enviado exitosamente, intenta enviar datos pendientes
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }

  @override
  Future<void> updatepassword(PasswordModels passwordModels) async {
    try {
      await http.put(
        Uri.parse('$_baseUrl/users/${passwordModels.id}/password'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'password': passwordModels.password,
        }),
      );

      // Ahora que los datos se han actualizado exitosamente, intenta enviar datos pendientes
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }

  @override
  Future<List<userModel>> getorders() async {
    final response =
        await http.get(Uri.parse('https://users.sazzon.site/api/v1/users'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<userModel> users =
          jsonResponse.map((user) => userModel.fromJson(user)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
