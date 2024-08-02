import 'package:sazzon/feature/address/data/models/address_models.dart';
import 'package:sazzon/feature/user/data/models/user_models.dart';

import '../../../Platillos/data/models/platillos_models.dart';


class OrdenModel {
  final userModel user;
  final AddressModel address;
  final PlatillosModel platillos;

  OrdenModel({required this.user, required this.address, required this.platillos});

   factory OrdenModel.fromJson(Map<String, dynamic> json) {
    return OrdenModel(
      user: userModel.fromJson(json['user']),
      address: AddressModel.fromJson(json['direction']), 
      platillos: PlatillosModel.fromJson(json['platillos'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'address': address.toJson(),
      'platillos': platillos.toJson()
    };
  }
}
