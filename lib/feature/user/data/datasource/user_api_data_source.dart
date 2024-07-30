import 'package:sazzon/feature/user/data/models/user_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../domain/entities/login.dart';

abstract class UserApiDataSource {
  Future<void> registerUser(userModel userModel);

  Future <userModel> postLogin(Login login);

  Future<void> updateUser(userModel userModel);
}

class UserApiDataSourceImp implements UserApiDataSource {
  final String _baseUrl = 'https://users.sazzon.site/api/v1';
  @override
   Future<userModel> postLogin(Login login) async {
    final Uri url = Uri.parse('$_baseUrl/userslogin');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': login.email,
        'password': login.password,
      }),
    );

    if (response.statusCode != 200) {
      print('Failed to create user: ${response.statusCode}');
      throw Exception('usuario y/o contraseña inválidos');
    }

    final body = jsonDecode(response.body);
    if (body == null) {
      throw Exception('Invalid or missing data in response');
    }

    int id = body['id'] is int ? body['id'] : int.parse(body['id']);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', id);

    return userModel(
      id: id,
      name: body['name'],
      email: body['email'],
      phone: body['phone'],
      password: body['password'],
      admin: body['admin'],
    );
  }
  

  @override
  Future<void> registerUser(userModel) async {
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
          'password': userModel.password,
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
          'password': userModel.password,
          'admin': userModel.admin,
        }),
      );

      // Ahora que los datos se han enviado exitosamente, intenta enviar datos pendientes
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }
  

}
