
import 'package:sazzon/feature/Platillos/data/models/platillos_models.dart';
import 'package:sazzon/feature/Platillos/domain/repository/platillos_repository.dart';
import 'package:sazzon/feature/orden/data/models/orden_models.dart';
import 'package:sazzon/feature/orden/domain/repository/orden_repository.dart';

class GetOrdenUsecase{
  final OrdenRepository ordenRepository;
  GetOrdenUsecase(this.ordenRepository);
  Future<List<OrdenModel>> execute() async{
    try {
      return await ordenRepository.getOrden();
    } catch (e) {
      throw e;
    }
  }
}

