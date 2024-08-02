
import 'package:sazzon/feature/orden/data/models/orden_models.dart';

abstract class CreateGetState {}

class ordenInitial extends CreateGetState {}

class ordenLoading extends CreateGetState {}

class PostsLoaded extends CreateGetState {
  final List<OrdenModel> posts;

  PostsLoaded(this.posts);
}

class ordenFetchingFailure extends CreateGetState {
  final String error;

  ordenFetchingFailure(this.error);
}
class ordenState {}

