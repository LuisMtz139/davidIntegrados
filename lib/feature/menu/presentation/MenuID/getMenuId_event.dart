

import 'package:sazzon/feature/user/data/models/user_models.dart';

abstract class GetIdEvent {}

class FetchMenuIdDetailsEvent {
    final String id;


  FetchMenuIdDetailsEvent(this.id);
}