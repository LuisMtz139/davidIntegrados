import 'package:flutter/widgets.dart';
import 'package:sazzon/feature/coment/data/models/comment_models.dart';
import 'package:sazzon/feature/coment/domain/repository/comment_repository.dart';
import 'package:sazzon/feature/menu/data/models/menu_models.dart';

class GetCommentUseCase {
  final CommentRepository commentRepository;

  GetCommentUseCase(this.commentRepository);

  Future<List<CommentModel>> execute(String id) async {
    try {
      print('hola desde cusecaseget');

      return await commentRepository.getComment(id);
    } catch (e) {
      print('Error al obtener xd comment: $e');
      throw e;
    }
  }
}
