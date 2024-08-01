

import 'package:sazzon/feature/Platillos/data/models/platillos_models.dart';
import 'package:sazzon/feature/user/data/models/user_models.dart';

abstract class CreatePostEvent {}

class CreatePlatillosEvent extends CreatePostEvent {
  final PlatillosModel platillosModel;



  CreatePlatillosEvent(  this.platillosModel);
}
