import '../../data/models/platillos_models.dart';

abstract class PlatillosRepository {
  Future<void> PoshPlatillos(PlatillosModel platillosModel);
  Future<List<PlatillosModel>> getPlatillos();
  Future<void> updatePlatillos(PlatillosModel platillosModel);
  Future<void> deletePlatillo(String id);
}
