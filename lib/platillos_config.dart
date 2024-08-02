
import 'package:sazzon/feature/Platillos/data/datasource/platillos_api_data_source.dart';
import 'package:sazzon/feature/Platillos/domain/usecase/delite_platillo_usecase.dart';
import 'package:sazzon/feature/Platillos/domain/usecase/get_platillos_usecase.dart';
import 'package:sazzon/feature/Platillos/domain/usecase/posh_platillos__usecase.dart';

import 'feature/Platillos/data/repositories/platillos_repository_implement.dart';

class PlatillosConfig{
  PlatillosApiDataSourceImp?platillosApiDataSourceImp;
  PlatillosRepositoryImp?platillosRepositoryImp;
  GetPlatillosUsecase?getPlatillosUsecase;
  PoshPlatilllosUsecase? poshPlatilllosUsecase;
  DelitePlatilloUsecase? delitePlatilloUsecase;
  PlatillosConfig(){
    platillosApiDataSourceImp = PlatillosApiDataSourceImp();
    platillosRepositoryImp = PlatillosRepositoryImp(platillosApiDataSource: platillosApiDataSourceImp!);
    getPlatillosUsecase = GetPlatillosUsecase(platillosRepositoryImp!);
    poshPlatilllosUsecase = PoshPlatilllosUsecase(platillosRepositoryImp!);
    delitePlatilloUsecase = DelitePlatilloUsecase(platillosRepositoryImp!);
  }
}