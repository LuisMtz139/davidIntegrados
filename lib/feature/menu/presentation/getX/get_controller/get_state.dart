

import '../../../../Platillos/data/models/platillos_models.dart';

abstract class CreateGetState {}

class platillosInitial extends CreateGetState {}

class platillosLoading extends CreateGetState {}

class PostsLoaded extends CreateGetState {
  final List<PlatillosModel> posts;

  PostsLoaded(this.posts);
}

class PlatillosFetchingFailure extends CreateGetState {
  final String error;

  PlatillosFetchingFailure(this.error);
}