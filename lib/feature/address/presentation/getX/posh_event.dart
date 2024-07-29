

import 'package:sazzon/feature/address/data/models/address_models.dart';
import 'package:sazzon/feature/coment/data/models/comment_models.dart';

abstract class CreatePostEvent {}

class CreateAddressEvent extends CreatePostEvent {
  final AddressModel addressModel;



  CreateAddressEvent(  this.addressModel);
}
