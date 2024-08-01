import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sazzon/feature/address/data/models/address_models.dart';

import '../../../address/data/datasource/address_api_data_source.dart';
import '../models/platillos_models.dart';

abstract class PlatillosApiDataSource {
  Future<void> PoshPlatilllos(AddressModel addressModel);
  Future<List<PlatillosModel>> getPlatilllos();
  Future<void> updatePlatilllos(AddressModel addressModel);
}

class PlatillosApiDataSourceImp implements PlatillosApiDataSource {
  final String _baseUrl = 'https://users.sazzon.site/api/v2/directions';
  final String _baseUrl2 = 'https://users.sazzon.site/api/v3/users';

  @override
  Future<void> PoshPlatilllos(AddressModel addressModel) {
    // TODO: implement PoshPlatilllos
    throw UnimplementedError();
  }

  @override
  Future<List<PlatillosModel>> getPlatilllos() async {
    final response = await http.get(Uri.parse('https://dish.sazzon.site/platillos/'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse['data'];
      List<PlatillosModel> platillos = data.map((plati) => PlatillosModel.fromJson(plati)).toList();
      print(platillos);
      return platillos;
    } else {
      throw Exception('Failed to load platillos');
    }
  }

  @override
  Future<void> updatePlatilllos(AddressModel addressModel) {
    // TODO: implement updatePlatilllos
    throw UnimplementedError();
  }
}
