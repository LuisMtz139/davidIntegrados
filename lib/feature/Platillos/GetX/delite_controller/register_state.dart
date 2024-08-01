// createpost_state.dart

abstract class CreatePostState {}

class PlatillosInitial extends CreatePostState {}

class PlatillosLoading extends CreatePostState {}

class PlatillosCreatedSuccessfully extends CreatePostState {}

class PlatillosCreationFailure extends CreatePostState {
  final String error;
  PlatillosCreationFailure(this.error);
}