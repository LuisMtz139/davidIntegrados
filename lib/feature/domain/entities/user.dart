class User {
   String? id;
  final String name;
  final String email;
  final String phone_number;
  final String password;

  User({
     this.id,
    required this.name,
    required this.email,
    required this.phone_number,
    required this.password,

  });
}