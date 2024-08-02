import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:sazzon/feature/coment/data/models/comment_models.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';
import 'package:sazzon/feature/coment/presentations/getx/Comment/getcommentCOntroller.dart';
import 'package:sazzon/feature/coment/presentations/getx/Comment/getcomment_event.dart';
import 'package:sazzon/feature/coment/presentations/getx/Comment/getcomment_state.dart';
import 'package:sazzon/feature/coment/presentations/getx/Comment/poshCOntroller.dart';
import 'package:sazzon/feature/coment/presentations/getx/Comment/posh_event.dart';
import 'package:sazzon/feature/orden/presentations/User/shopingcar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Platillo extends StatefulWidget {
  final String nombrePlatillo;
  final String descripcion;
  final double precio;
  final String id;
  final String imagen;

  const Platillo({
    Key? key,
    required this.nombrePlatillo,
    required this.descripcion,
    required this.precio,
    required this.id,
    required this.imagen,
  }) : super(key: key);

  @override
  State<Platillo> createState() => _PlatilloState();
}

class _PlatilloState extends State<Platillo> {
  final TextEditingController mycommentController = TextEditingController();
  final GetCommentController _controller = Get.find<GetCommentController>();
  final PoshCommentController poshCommentController =
      Get.find<PoshCommentController>();
  final _formKey = GlobalKey<FormState>();

  int _contador = 0;

  @override
  void initState() {
    super.initState();
    _controller.fetchCoDetails(FetchCommentDetailsEvent(widget.id));
    _savePlatilloId(widget.id);
    print('hola soy id de platillo: ' + widget.id);
  }

  Future<void> _savePlatilloId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('platillo_id', id);
  }

  ImageProvider _getImageProvider(String imageString) {
    if (imageString.startsWith('data:image')) {
      String base64Image = imageString.split(',')[1];
      return MemoryImage(base64Decode(base64Image));
    } else if (imageString.startsWith('http') ||
        imageString.startsWith('https')) {
      return NetworkImage(imageString);
    } else {
      return AssetImage(imageString);
    }
  }

  void _incrementCounter() {
    setState(() {
      _contador++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_contador > 0) {
        _contador--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      drawer: const BarMenu(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "SEZZON",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingCartPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 270, 0),
              child: Container(
                width: 250,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Image.asset(
                        'assets/star_1.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: _getImageProvider(widget.imagen),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nombrePlatillo,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${widget.precio.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          widget.descripcion,
                          style: const TextStyle(color: Color(0xFFBDCEA1)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 88,
              decoration: const BoxDecoration(
                color: Color(0xFFF6532A),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _contador++;
                  });
                  // Crear la orden
                  createOrder(widget.id, _contador);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  "Añadir",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(color: Color(0xFFF6532A), width: 6.0)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text('¡Califica el platillo!'),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: mycommentController,
                              decoration: InputDecoration(
                                hintText: 'Escribe un comentario',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, escribe un comentario';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              final userId = prefs.getString('userId');

                              print("userId obtenido: $userId");
                              if (_formKey.currentState!.validate()) {
                                Get.dialog(
                                  const Center(
                                      child: CircularProgressIndicator()),
                                  barrierDismissible: false,
                                );
                                final post = CommentModel(
                                  id_platillo: widget.id,
                                  id_user:
                                      userId.toString(), // Asegúrate de tener un ID de usuario válido
                                  comentario: mycommentController.text,
                                  calificacion:
                                      1, // Considera agregar una forma de calificar
                                );
                                await poshCommentController
                                    .createComment(CreateCommentEvent(post));
                                mycommentController.clear();
                                await _controller.fetchCoDetails(
                                    FetchCommentDetailsEvent(widget.id));
                                Get.back(); // Cierra el diálogo de carga
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF6532A),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13)),
                            ),
                            child: const Text('Enviar',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 300,
                    child: Obx(() {
                      if (_controller.state.value is CommentLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (_controller.state.value is PostsLoaded) {
                        var posts =
                            (_controller.state.value as PostsLoaded).posts;
                        return ListView.builder(
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            var post = posts[index];
                            return ListTile(
                              title: Text('Usuario ${post.id_user}'),
                              subtitle: Text(post.comentario),
                            );
                          },
                        );
                      } else if (_controller.state.value
                          is CommentFetchingFailure) {
                        return Center(
                          child: Text((_controller.state.value
                                  as CommentFetchingFailure)
                              .error),
                        );
                      } else {
                        return const Center(
                            child: Text("Estado no reconocido"));
                      }
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createOrder(String platilloId, int quantity) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    if (userId == null) {
      print('Error: Usuario no encontrado');
      return;
    }

    final url = Uri.parse('https://orders.sazzon.site/orders');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'userId': int.parse(userId),
        'directionId': 2,
        'dishIds': [platilloId],
        'quantities': [quantity],
        'status': ''
      }),
    );

    if (response.statusCode == 201) {
      print('Orden creada exitosamente');
    } else {
      print('Error al crear la orden: ${response.statusCode}');
      print('Respuesta: ${response.body}');
    }
  }
}
