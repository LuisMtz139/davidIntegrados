import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/coment/data/models/comment_models.dart';
import 'package:sazzon/feature/coment/presentations/getx/Comment/poshCOntroller.dart';
import 'package:sazzon/feature/coment/presentations/getx/Comment/posh_event.dart';

class CrearComentario extends StatelessWidget {
  final String idPlatillo;

  CrearComentario({required this.idPlatillo});

  final TextEditingController mycommentController = TextEditingController();
  final PoshCommentController poshCommentController = Get.find<PoshCommentController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Comentario'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: mycommentController,
                decoration: InputDecoration(
                  hintText: 'Escribe un comentario',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, escribe un comentario';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Get.dialog(
                      const Center(child: CircularProgressIndicator()),
                      barrierDismissible: false,
                    );
                    final post = CommentModel(
                      id_platillo: idPlatillo,
                      id_user: '2', // Asegúrate de tener un ID de usuario válido
                      comentario: mycommentController.text,
                      calificacion: 1, // Considera agregar una forma de calificar
                    );
                    await poshCommentController.createComment(CreateCommentEvent(post));
                    mycommentController.clear();
                    Get.back(); // Cierra el diálogo de carga
                    Get.back(); // Regresa a la pantalla anterior
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF6532A),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                ),
                child: const Text('Enviar', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
