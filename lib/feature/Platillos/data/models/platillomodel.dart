class PlatilloModel {
  final String id;
  final String nombre;
  final String descripcion;
  final double precio;

  PlatilloModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
  });

  factory PlatilloModel.fromJson(Map<String, dynamic> json) {
    return PlatilloModel(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: json['precio'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
    };
  }
}
