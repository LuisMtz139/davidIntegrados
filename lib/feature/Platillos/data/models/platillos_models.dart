import '../../domain/entities/patillos.dart';

class PlatillosModel extends Platillos {
  PlatillosModel({
    String? id,
    String? nombre,
     String? nombre_platillo,
    required String descripcion,
    required int precio,
     String? categoria,
     String? imagen,
     String? ingredientes,
  }) : super(
          id: id,
          nombre:nombre,
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
      nombre:json['nombre'] ?? '',
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
      nombre: platillos.nombre,
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
      'nombre': nombre,
      'nombre_platillo': nombre_platillo,
      'descripcion': descripcion,
      'precio': precio,
      'categoria': categoria,
      'imagen': imagen,
      'ingredientes': ingredientes,
    };
  }
}
