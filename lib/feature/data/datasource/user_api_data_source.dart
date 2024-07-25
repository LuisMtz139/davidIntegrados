import 'package:sazzon/feature/data/models/user_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class UserApiDataSource {
  Future<void> registerUser(userModel userModel);

  Future<void> logIn({required String email, required String password});

  Future<void> updateUser({
    required String id,
    required String name,
    required String email,
    required String phoneNumber,
  });
}

class UserApiDataSourceImp implements UserApiDataSource {
  final String _baseUrl = 'http://44.203.192.212:3000/api/v1';

  @override
  Future<void> logIn({required String email, required String password}) {
    // TODO: implement logIn
    throw UnimplementedError();
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
  Future<void> updateUser(
      {required String id,
      required String name,
      required String email,
      required String phoneNumber}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
