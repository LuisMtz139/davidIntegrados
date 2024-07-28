import 'package:sazzon/feature/user/data/models/user_models.dart';

abstract class UserRepository {
  Future<void> registerUser(userModel userModel);

  Future<void> logIn({ required String email, required String password});

  Future<void> updateUser(userModel userModel);


}