// createpost_state.dart

abstract class DelitePostState {}

class DeliteInitial extends DelitePostState {}

class DeliteLoading extends DelitePostState {}

class DelitePlatillosSuccessfully extends DelitePostState {}

class DelitePlatillosFailure extends DelitePostState {
  final String error;
  DelitePlatillosFailure(this.error);
}