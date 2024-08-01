

import '../../../address/data/models/address_models.dart';
import '../../domain/repository/platillos_repository.dart';
import '../datasource/platillos_api_data_source.dart';
import '../models/platillos_models.dart';

class OrdenRepositoryImp implements OrdenRepository {
  final PlatillosApiDataSource platillosApiDataSource;

  OrdenRepositoryImp({required this.platillosApiDataSource});
  
  @override
  Future<List<AddressModel>> getOrden() async {
       return await platillosApiDataSource.getPlatilllos();

  }  
}
