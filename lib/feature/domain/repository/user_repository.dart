import 'package:sazzon/feature/data/models/user_models.dart';

abstract class UserRepository {
  Future<void> registerUser(userModel userModel);

  Future<void> logIn({ required String email, required String password});

  Future<void> updateUser({
    required String id,
    required String name,
    required String email,
    required String phone_number,
  });


}