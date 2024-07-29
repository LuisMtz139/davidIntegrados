import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sazzon/feature/address/data/models/address_models.dart';

abstract class AddressApiDataSource {
  Future<void> PoshAddres(AddressModel addressModel);

  Future<List<AddressModel>> getAddress();

  Future<void> updateAddress(AddressModel addressModel);
}

class AddressApiDataSourceImp implements AddressApiDataSource {
  final String _baseUrl = 'http://44.203.192.212:3000/api/v2/directions';

  @override
  Future<List<AddressModel>> getAddress() async {
    var response = await http.get(Uri.parse('$_baseUrl/'));
//          Uri.parse('$_baseUrl/users'),

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print(body);

      // Asegúrate de acceder a la clave 'data' si los datos están contenidos ahí
      if (body['data'] != null) {
        List<dynamic> data = body['data'];
        List<AddressModel> posts = data
            .map<AddressModel>((post) => AddressModel.fromJson(post))
            .toList();
        return posts;
      } else {
        throw Exception('Data field is missing');
      }
    } else {
      throw Exception('Failed to load menu');
    }
  }

  @override
  Future<void> PoshAddres(AddressModel addressModel) async {
    try {
      await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'userId': addressModel.userId,
          'postcode': addressModel.postcode,
          'calle': addressModel.calle,
          'colonia': addressModel.colonia,
          'num_ext': addressModel.num_ext,
          'num_int': addressModel.num_int,
          'estado': addressModel.estado,
          'ciudad': addressModel.ciudad,
          'descripcion': addressModel.descripcion,
        }),
      );

      // Ahora que los datos se han enviado exitosamente, intenta enviar datos pendientes
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }

  @override
  Future<void> updateAddress(AddressModel addressModel) {
    // TODO: implement updateAddress
    throw UnimplementedError();
  }
}
