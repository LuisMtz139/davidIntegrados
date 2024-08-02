import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/coment/presentations/getx/Comment/getcommentCOntroller.dart';
import 'package:sazzon/feature/coment/presentations/getx/Comment/getcomment_event.dart';
import 'package:sazzon/feature/coment/presentations/getx/Comment/getcomment_state.dart';

class VerComentarios extends StatelessWidget {
  final String idPlatillo;

  VerComentarios({required this.idPlatillo});

  final GetCommentController _controller = Get.find<GetCommentController>();

  @override
  Widget build(BuildContext context) {
    _controller.fetchCoDetails(FetchCommentDetailsEvent(idPlatillo));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comentarios'),
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        if (_controller.state.value is CommentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (_controller.state.value is PostsLoaded) {
          var posts = (_controller.state.value as PostsLoaded).posts;
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
        } else if (_controller.state.value is CommentFetchingFailure) {
          return Center(
            child: Text((_controller.state.value as CommentFetchingFailure).error),
          );
        } else {
          return const Center(child: Text("Estado no reconocido"));
        }
      }),
    );
  }
}
