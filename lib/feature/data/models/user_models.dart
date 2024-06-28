
import 'package:sazzon/feature/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
     String? id,
    required String name,
    required String email,
    required String phone_number,
    required String password,
  }) : super(
    id: id,
    name: name,
    email: email,
    phone_number: phone_number,
    password: password,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone_number: json['phone_number'],
      password: json['password'],
    );
  }


  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      phone_number: user.phone_number,
      password: user.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phone_number,
      'password': password,
    };
  }
}
