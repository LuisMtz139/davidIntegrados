

import 'package:sazzon/feature/user/data/models/user_models.dart';

abstract class CreatePostEvent {}

class CreatePlatillosEvent extends CreatePostEvent {
  final userModel user;



  CreatePlatillosEvent(  this.user);
}
