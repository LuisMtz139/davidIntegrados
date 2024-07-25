import 'package:flutter/cupertino.dart';
import 'package:sazzon/feature/data/models/user_models.dart';
import 'package:sazzon/feature/domain/repository/user_repository.dart';



class RegisterUserUseCase {
  final UserRepository userRepository;
  RegisterUserUseCase(this.userRepository);

  Future<void> execute(userModel userModel,

  ) async {
    try {
      await userRepository.registerUser(userModel);

    } catch (e,stackTrace) {
      print('Error during user registration: $e');
      print('StackTrace: $stackTrace');
      throw e;
    }
  }

}