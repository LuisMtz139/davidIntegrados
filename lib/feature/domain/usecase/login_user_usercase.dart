import 'package:flutter/widgets.dart';
import 'package:sazzon/feature/domain/repository/user_repository.dart';

class LogInUserUseCase {
  final UserRepository userRepository;

  LogInUserUseCase(this.userRepository);

  Future<void> execute( String email, String password) async {
    return await userRepository.logIn( email: email, password: password);
  }
}