class Address {
  String? id;
  final String userId;
  final String calle;
  final String postcode;
  final String colonia;
  final String num_ext;
  final String num_int;
  final String estado;
  final String ciudad;
  final String descripcion;

  Address({
    this.id,
    required this.userId,
    required this.calle,
    required this.postcode,
    required this.colonia,
    required this.num_ext,
    required this.num_int,
    required this.estado,
    required this.ciudad,
    required this.descripcion,
  });
}
