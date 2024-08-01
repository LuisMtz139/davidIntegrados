import '../../domain/entities/patillos.dart';

class PlatillosModel extends Platillos {
  PlatillosModel({
    String? id,
    required String nombre_platillo,
    required String descripcion,
    required int precio,
    required String categoria,
    required String imagen,
    required String ingredientes,
  }) : super(
          id: id,
          nombre_platillo: nombre_platillo,
          descripcion: descripcion,
          precio: precio,
          categoria: categoria,
          imagen: imagen,
          ingredientes: ingredientes,
        );

  factory PlatillosModel.fromJson(Map<String, dynamic> json) {
    return PlatillosModel(
      id: json['id'] ?? '',
      nombre_platillo: json['nombre_platillo'] ?? '',
      descripcion: json['descripcion'] ?? '',
      precio: json['precio'] ?? '',
      categoria: json['categoria'] ?? '',
      imagen: json['imagen'] ?? '',
      ingredientes: json['ingredientes'] ?? '',
    );
  }

  factory PlatillosModel.fromEntity(Platillos platillos) {
    return PlatillosModel(
      id: platillos.id,
      nombre_platillo: platillos.nombre_platillo,
      descripcion: platillos.descripcion,
      precio: platillos.precio,
      categoria: platillos.categoria,
      imagen: platillos.imagen,
      ingredientes: platillos.ingredientes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre_platillo': nombre_platillo,
      'descripcion': descripcion,
      'precio': precio,
      'categoria': categoria,
      'imagen': imagen,
      'ingredientes': ingredientes,
    };
  }
}
