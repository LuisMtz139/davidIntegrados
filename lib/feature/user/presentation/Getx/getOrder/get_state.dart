import 'package:sazzon/feature/address/data/models/address_models.dart';
import 'package:sazzon/feature/user/data/models/user_models.dart';

abstract class CreateGetState {}

class userInitial extends CreateGetState {}

class userLoading extends CreateGetState {}

class PostsLoaded extends CreateGetState {
  final List<userModel> posts;

  PostsLoaded(this.posts);
}

class userFetchingFailure extends CreateGetState {
  final String error;

  userFetchingFailure(this.error);
}