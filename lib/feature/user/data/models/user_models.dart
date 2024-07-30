
import 'package:sazzon/feature/user/domain/entities/user.dart';

class userModel extends User {
  userModel({
     super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.password,
    required super.admin
  });

  factory userModel.fromJson(Map<String, dynamic> json) {
    return userModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      admin:json['admin']
    );
  }


  factory userModel.fromEntity(User user) {
    return userModel(
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone,
      password: user.password,
      admin:user.admin
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'admin':admin
    };
  }
}
