import '../../../address/data/models/address_models.dart';
import '../../data/models/platillos_models.dart';

abstract class OrdenRepository {
  Future<List<AddressModel>> getOrden();
}