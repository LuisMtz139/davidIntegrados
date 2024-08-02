import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sazzon/feature/address/data/models/address_models.dart';

import '../../../address/data/datasource/address_api_data_source.dart';
import '../models/platillos_models.dart';

abstract class PlatillosApiDataSource {
  Future<void> PoshPlatilllos(PlatillosModel platillosModel);
  Future<List<PlatillosModel>> getPlatilllos();
  Future<void> updatePlatilllos(AddressModel addressModel);
  Future<void> deletePlatillo(String id);
}

class PlatillosApiDataSourceImp implements PlatillosApiDataSource {
  final String _baseUrl = 'http://54.87.184.70:3002/platillos';
  final String _baseUrl2 = 'https://users.sazzon.site/api/v3/users';

  @override
  Future<void> PoshPlatilllos(PlatillosModel platillosModel) async {
    final url = '$_baseUrl';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['nombre_platillo'] =
        platillosModel.nombre_platillo.toString();
    request.fields['descripcion'] = platillosModel.descripcion;
    request.fields['precio'] = platillosModel.precio.toString();
    request.fields['categoria'] = platillosModel.categoria.toString();
    var pic = await http.MultipartFile.fromPath(
        'imagen',
        platillosModel.imagen
            .toString()); // Cambia el nombre del campo si es necesario
    request.files.add(pic);
    request.fields['ingredientes'] = platillosModel.ingredientes.toString();

    try {
      var response = await request.send();
      if (response.statusCode == 201) {
        print('User created successfully');
      } else {
        print('Failed to create platillo');
        print('Status code: ${response.statusCode}');
        print('Response body: ${await response.stream.bytesToString()}');
        throw Exception('Failed to create platillo');
      }
    } catch (error) {
      print('Error sending data to API: $error');
      // Puedes manejar el error según tus necesidades
    }
  }

  @override
  Future<List<PlatillosModel>> getPlatilllos() async {
    final response =
        await http.get(Uri.parse('http://54.87.184.70:3002/platillos'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse['data'];
      List<PlatillosModel> platillos =
          data.map((plati) => PlatillosModel.fromJson(plati)).toList();
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

  @override
  Future<void> deletePlatillo(String id) async {
    try {
      final http.Response response = await http.delete(
        Uri.parse('$_baseUrl/$id'),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete user');
      }
    } catch (e) {
      print('Error during network call: $e');
      throw Exception('Network error');
    }
  }
}
