import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sazzon/feature/address/data/models/address_models.dart';
import 'package:sazzon/feature/orden/data/models/orden_models.dart';

abstract class OrdenApiDataSource {
  Future<List<OrdenModel>> getOrden();
}

class OrdenApiDataSourceImp implements OrdenApiDataSource {
  @override
  Future<List<OrdenModel>> getOrden() async {
    var url = Uri.parse('https://orders.sazzon.site/orders');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        var json = jsonDecode(response.body) as List;
        print(json);
        return json.map((orderJson) => OrdenModel.fromJson(orderJson)).toList();
      } catch (e) {
        print("Error during parsing: $e");
        throw Exception('Failed to parse orders');
      }
    } else {
      print("Failed to fetch data: ${response.statusCode}");
      throw Exception('Failed to load orders');
    }
  }
}
