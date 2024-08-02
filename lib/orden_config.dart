import 'package:sazzon/feature/orden/data/datasource/orden_api_data_source.dart';
import 'package:sazzon/feature/orden/data/repositories/orden_repository_implement.dart';
import 'package:sazzon/feature/orden/domain/usecase/get_orden_usecase.dart';

class OrdenConfig {
  OrdenApiDataSourceImp? ordenApiDataSourceImp;
  OrdenRepositoryImp? ordenRepositoryImp;
  GetOrdenUsecase? getOrdenUsecase;
  OrdenConfig() {
    ordenApiDataSourceImp = OrdenApiDataSourceImp();
    ordenRepositoryImp =
        OrdenRepositoryImp(ordenApiDataSource: ordenApiDataSourceImp!);

    getOrdenUsecase = GetOrdenUsecase(ordenRepositoryImp!);
  }
}
