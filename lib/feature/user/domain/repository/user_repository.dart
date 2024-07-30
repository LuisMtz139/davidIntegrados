import 'package:sazzon/feature/user/data/models/user_models.dart';

import '../entities/login.dart';
import '../entities/session.dart';

abstract class UserRepository {
  Future<void> registerUser(userModel userModel);

  Future <userModel> postLogin(Login login);

  Future<void> updateUser(userModel userModel);


}