import 'package:flutter/material.dart';
import 'package:sazzon/feature/coment/domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel({
    String? id,
    required String id_platillo,
    required String id_user,
    required String comentario,
    required double calificacion,
  }) : super(
          id: id,
          id_platillo: id_platillo,
          id_user: id_user,
          comentario: comentario,
          calificacion: calificacion,
        );

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      id_platillo: json['id_platillo'],
      id_user: json['id_user'],
      comentario: json['comentario'],
      calificacion: (json['calificacion'] is String)
          ? double.tryParse(json['calificacion']) ?? 0.0
          : (json['calificacion'] ?? 0.0),
    );
  }

  factory CommentModel.fromEntity(Comment comment) {
    return CommentModel(
      id: comment.id,
      id_platillo: comment.id_platillo,
      id_user: comment.id_user,
      comentario: comment.comentario,
      calificacion: comment.calificacion,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_platillo': id_platillo,
      'id_user': id_user,
      'comentario': comentario,
      'calificacion': calificacion,
    };
  }
}
