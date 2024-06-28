import 'package:sazzon/feature/data/models/user_models.dart';

abstract class UserApiDataSource {
  Future<void> registerUser(UserModel userModel);

  Future<void> logIn({required String email, required String password});

  Future<void> updateUser({
    required String id,
    required String name,
    required String email,
    required String phoneNumber,
  });
}




class UserApiDataSourceImp implements UserApiDataSource {
  @override
  Future<void> logIn({required String email, required String password}) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<void> registerUser(userModel) {
    // TODO: implement registerUser
    throw UnimplementedError();
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
