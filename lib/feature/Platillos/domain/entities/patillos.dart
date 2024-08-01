
class Platillos{
  String? id;
  final String nombre_platillo;
  final String descripcion;
  final int precio;
  final String categoria;
  final String imagen;
  final String ingredientes;

  Platillos({
    this.id,
    required this.nombre_platillo,
    required this.descripcion,
    required this.precio,
    required this.categoria,
    required this.imagen,
    required this.ingredientes,
  });
}
