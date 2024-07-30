import 'package:sazzon/feature/user/data/datasource/user_api_data_source.dart';
import 'package:sazzon/feature/user/data/repositories/user_repository_implement.dart';
import 'package:sazzon/feature/user/domain/usecase/login_user_usercase.dart';
import 'package:sazzon/feature/user/domain/usecase/register_user_usecase.dart';

class UsercaseConfig {
  UserApiDataSourceImp? userApiDataSourceImp;
  UserRepositoryImp? userRepositoryImp;
  RegisterUserUseCase? registerUserUseCase;
  LoginUserUsercase? loginUserUsercase;

  UsercaseConfig() {
    userApiDataSourceImp = UserApiDataSourceImp();
    userRepositoryImp =
        UserRepositoryImp(userApiDataSource: userApiDataSourceImp!);
    registerUserUseCase = RegisterUserUseCase(userRepositoryImp!);
    loginUserUsercase = LoginUserUsercase(userRepositoryImp!);
  }
}
