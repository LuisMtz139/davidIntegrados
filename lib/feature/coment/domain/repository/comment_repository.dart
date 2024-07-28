import 'package:sazzon/feature/coment/data/models/comment_models.dart';
import 'package:sazzon/feature/menu/data/models/menu_models.dart';

abstract class CommentRepository {
  Future<void> PoshComment(CommentModel commentModel);
  Future<List<CommentModel>>getComment(String id);
}