
import 'package:sazzon/feature/Platillos/data/datasource/platillos_api_data_source.dart';
import 'package:sazzon/feature/Platillos/domain/usecase/get_platillos_usecase.dart';

import 'feature/Platillos/data/repositories/platillos_repository_implement.dart';

class PlatillosConfig{
  PlatillosApiDataSourceImp?platillosApiDataSourceImp;
  PlatillosRepositoryImp?platillosRepositoryImp;
  GetPlatillosUsecase?getPlatillosUsecase;
  PlatillosConfig(){
    platillosApiDataSourceImp = PlatillosApiDataSourceImp();
    platillosRepositoryImp = PlatillosRepositoryImp(platillosApiDataSource: platillosApiDataSourceImp!);
    getPlatillosUsecase = GetPlatillosUsecase(platillosRepositoryImp!);
  }
}