
import 'package:sazzon/feature/Platillos/data/models/platillos_models.dart';
import 'package:sazzon/feature/Platillos/domain/repository/platillos_repository.dart';

class GetPlatillosUsecase{
  final PlatillosRepository platillosRepository;
  GetPlatillosUsecase(this.platillosRepository);
  Future<List<PlatillosModel>> execute() async{
    try {
      return await platillosRepository.getPlatillos();
    } catch (e) {
      throw e;
    }
  }
}

