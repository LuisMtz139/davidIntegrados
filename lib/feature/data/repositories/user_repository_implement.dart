import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

import 'package:flutter/widgets.dart';
import 'package:sazzon/feature/data/datasource/user_api_data_source.dart';
import 'package:sazzon/feature/domain/repository/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserApiDataSource userApiDataSource;

  UserRepositoryImp({required this.userApiDataSource});

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
  Future<void> updateUser({required String id, required String name, required String email, required String phone_number}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }


}
