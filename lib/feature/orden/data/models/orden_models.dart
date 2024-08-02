import 'package:sazzon/feature/address/data/models/address_models.dart';
import 'package:sazzon/feature/user/data/models/user_models.dart';
import '../../../Platillos/data/models/platillos_models.dart';
import '../../../Platillos/data/models/platillomodel.dart';
class OrdenModel {
  final userModel user;
  final AddressModel address;
  final List<PlatillosModel> platillos;
  final List<int> quantities;
  final int total;
  final String status;

  OrdenModel({
    required this.user,
    required this.address,
    required this.platillos,
    required this.quantities,
    required this.total,
    required this.status,
  });

  factory OrdenModel.fromJson(Map<String, dynamic> json) {
    return OrdenModel(
      user: userModel.fromJson(json['user']),
      address: AddressModel.fromJson(json['direction']),
      platillos: (json['platillos'] as List)
          .map((item) => PlatillosModel.fromJson(item))
          .toList(),
      quantities: List<int>.from(json['quantities']),
      total: json['total'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'address': address.toJson(),
      'platillos': platillos.map((item) => item.toJson()).toList(),
      'quantities': quantities,
      'total': total,
      'status': status,
    };
  }
}
