

import '../../domain/repository/platillos_repository.dart';
import '../datasource/platillos_api_data_source.dart';
import '../models/platillos_models.dart';

class PlatillosRepositoryImp implements PlatillosRepository {
  final PlatillosApiDataSource platillosApiDataSource;

  PlatillosRepositoryImp({required this.platillosApiDataSource});
  
  @override
  Future<void> PoshPlatillos(PlatillosModel platillosModel) {
    // TODO: implement PoshPlatillos
    throw UnimplementedError();
  }
  
  @override
  Future<List<PlatillosModel>> getPlatillos() async {
       return await platillosApiDataSource.getPlatilllos();

  }
  
  @override
  Future<void> updatePlatillos(PlatillosModel platillosModel) {
    // TODO: implement updatePlatillos
    throw UnimplementedError();
  }

  
}
