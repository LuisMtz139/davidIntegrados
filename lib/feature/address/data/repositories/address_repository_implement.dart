
import 'package:sazzon/feature/address/data/datasource/address_api_data_source.dart';
import 'package:sazzon/feature/address/data/models/address_models.dart';
import 'package:sazzon/feature/address/domain/repository/Address_repository.dart';
import 'package:sazzon/feature/coment/data/models/comment_models.dart';

class AddressRepositoryImp implements AddressRepository {
  final AddressApiDataSource addressApiDataSource;

  AddressRepositoryImp({required this.addressApiDataSource});

  @override
  Future<void> PoshAddres(AddressModel addressModel)async {
    await addressApiDataSource.PoshAddres(addressModel);
  }

  @override
  Future<List<AddressModel>> getAddress()async => await addressApiDataSource.getAddress();

  @override
  Future<void> updateAddress(AddressModel addressModel)async {
    await addressApiDataSource.updateAddress(addressModel);
  }

}

