import 'package:sazzon/feature/data/datasource/user_api_data_source.dart';
import 'package:sazzon/feature/data/repositories/user_repository_implement.dart';
import 'package:sazzon/feature/domain/usecase/register_user_usecase.dart';

class UsercaseConfig {

    UserApiDataSourceImp? userApiDataSourceImp;
    UserRepositoryImp? userRepositoryImp;
    RegisterUserUseCase? registerUserUseCase;
  UsercaseConfig() {
    userApiDataSourceImp= UserApiDataSourceImp();
    userRepositoryImp= UserRepositoryImp(userApiDataSource: userApiDataSourceImp!);
    registerUserUseCase= RegisterUserUseCase(userRepositoryImp!);

  }
}
