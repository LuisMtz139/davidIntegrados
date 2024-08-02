

import '../../../address/data/models/address_models.dart';
import '../../domain/repository/orden_repository.dart';
import '../datasource/orden_api_data_source.dart';
import '../models/orden_models.dart';

class OrdenRepositoryImp implements OrdenRepository {
  final OrdenApiDataSource ordenApiDataSource;

  OrdenRepositoryImp({required this.ordenApiDataSource});
  
  @override
  Future<List<OrdenModel>> getOrden() async{
   return await ordenApiDataSource.getOrden();
  }
  
 
}
