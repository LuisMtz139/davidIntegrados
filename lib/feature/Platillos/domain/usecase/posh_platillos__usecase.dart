import 'package:sazzon/feature/Platillos/data/models/platillos_models.dart';
import 'package:sazzon/feature/Platillos/domain/repository/platillos_repository.dart';

class PoshPlatilllosUsecase {
  PlatillosRepository platillosRepository;
  PoshPlatilllosUsecase(this.platillosRepository);
  Future<void> execute(PlatillosModel platillosModel) async {
    try {
      await platillosRepository.PoshPlatillos(platillosModel);
    } catch (e) {
      print('error pa $e');
      throw e;
    }
  }
}
