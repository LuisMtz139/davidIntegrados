import 'package:flutter/cupertino.dart';
import 'package:sazzon/feature/data/models/user_models.dart';
import 'package:sazzon/feature/domain/repository/user_repository.dart';



class RegisterUserUseCase {
  final UserRepository userRepository;
  RegisterUserUseCase(this.userRepository);

  Future<void> execute(UserModel userModel,

  ) async {
    try {
      await userRepository.registerUser(
           userModel

      );

    } catch (e) {
      // Maneja cualquier excepción que pueda ocurrir durante el registro
      print('Error during user registration: $e');
      // Puedes lanzar la excepción nuevamente o manejarla de otra manera según tus necesidades
      throw e;
    }
  }

}