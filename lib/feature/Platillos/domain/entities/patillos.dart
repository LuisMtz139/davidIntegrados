class Platillos {
  String? id;
  String? nombre;
  String? nombre_platillo;
  final String descripcion;
  final int precio;
  String? categoria;
  String? imagen;
  String? ingredientes;

  Platillos({
    this.id,
    this.nombre,
     this.nombre_platillo,
    required this.descripcion,
    required this.precio,
    this.categoria,
    this.imagen,
    this.ingredientes,
  });
}
