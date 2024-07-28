import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

import 'package:flutter/widgets.dart';
import 'package:sazzon/feature/coment/data/datasource/Comment_api_data_source.dart';
import 'package:sazzon/feature/coment/data/models/comment_models.dart';
import 'package:sazzon/feature/coment/domain/repository/comment_repository.dart';
import 'package:sazzon/feature/menu/data/models/menu_models.dart';

class CommentRepositoryImp implements CommentRepository {
  final CommentApiDataSource commentApiDataSource;

  CommentRepositoryImp({required this.commentApiDataSource});

  @override
  Future<void> PoshComment(CommentModel commentModel)async {
    await commentApiDataSource.PoshComment(commentModel);
  }
  
  @override
  Future<List<CommentModel>> getComment(String id)async => await commentApiDataSource.getComment(id);

 
}

