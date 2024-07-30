import 'package:sazzon/feature/user/data/models/user_models.dart';
import 'package:sazzon/feature/user/domain/repository/user_repository.dart';
import '../entities/login.dart';
import '../entities/session.dart';

class LoginUserUsercase{
  final UserRepository userRepository;
  LoginUserUsercase(this.userRepository);
  Future<userModel> excute(Login login)async{
    return await userRepository.postLogin(login);
  }
}