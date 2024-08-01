class User {
  int? id;
  final String name;
  final String email;
  final String phone;
  String? password;
  final String admin;

  User(
      {this.id,
      required this.name,
      required this.email,
      required this.phone,
      this.password,
      required this.admin});
}
