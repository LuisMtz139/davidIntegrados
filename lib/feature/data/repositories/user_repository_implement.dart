import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

import 'package:flutter/widgets.dart';
import 'package:sazzon/feature/data/datasource/user_api_data_source.dart';
import 'package:sazzon/feature/data/models/user_models.dart';
import 'package:sazzon/feature/domain/repository/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserApiDataSource userApiDataSource;

  UserRepositoryImp({required this.userApiDataSource});

  @override
  Future<void> logIn({required String email, required String password}) async{
    await userApiDataSource.logIn(email: email, password: password);
  }

 
  
  @override
  Future<void> updateUser({required String id, required String name, required String email, required String phone_number}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<void> registerUser(userModel userModel) async{
    await userApiDataSource.registerUser(userModel);
  }


}
