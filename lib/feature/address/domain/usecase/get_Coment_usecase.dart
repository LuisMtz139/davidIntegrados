import 'package:flutter/widgets.dart';
import 'package:sazzon/feature/address/data/models/address_models.dart';
import 'package:sazzon/feature/address/domain/repository/Address_repository.dart';
import 'package:sazzon/feature/coment/data/models/comment_models.dart';
import 'package:sazzon/feature/coment/domain/repository/comment_repository.dart';
import 'package:sazzon/feature/menu/data/models/menu_models.dart';

class GetAddressUseCase {
  final AddressRepository addressRepository;

  GetAddressUseCase(this.addressRepository);

  Future<List<AddressModel>> execute() async {
    try {
      print('hola desde cusecaseget');

      return await addressRepository.getAddress();
    } catch (e) {
      print('Error al obtener xd comment: $e');
      throw e;
    }
  }
}
