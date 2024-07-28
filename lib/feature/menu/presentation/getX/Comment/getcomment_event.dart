

import 'package:sazzon/feature/user/data/models/user_models.dart';

abstract class CreatePostEvent {}

class FetchCommentDetailsEvent {
  
    final String id;

  FetchCommentDetailsEvent(this.id);
}