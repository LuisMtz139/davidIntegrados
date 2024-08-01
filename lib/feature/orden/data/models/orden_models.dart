import 'package:sazzon/feature/address/data/models/address_models.dart';
import 'package:sazzon/feature/user/data/models/user_models.dart';


class OrdenModel {
  final userModel user;
  final AddressModel address;

  OrdenModel({required this.user, required this.address});

   factory OrdenModel.fromJson(Map<String, dynamic> json) {
    return OrdenModel(
      user: userModel.fromJson(json['user']),
      address: AddressModel.fromJson(json['direction']), 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'address': address.toJson(),
    };
  }
}
