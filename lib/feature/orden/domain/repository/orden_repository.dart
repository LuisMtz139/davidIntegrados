import '../../../address/data/models/address_models.dart';
import '../../data/models/orden_models.dart';

abstract class OrdenRepository {
  Future<List<OrdenModel>> getOrden();
}