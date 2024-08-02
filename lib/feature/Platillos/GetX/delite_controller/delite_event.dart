

import 'package:sazzon/feature/Platillos/data/models/platillos_models.dart';
import 'package:sazzon/feature/user/data/models/user_models.dart';

abstract class DelitePostEvent {}

class DelitePlatillosEvent extends DelitePostEvent {
  final String id;



  DelitePlatillosEvent(  this.id);
}
