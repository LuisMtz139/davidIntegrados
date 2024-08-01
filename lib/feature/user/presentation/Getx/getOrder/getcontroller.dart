import 'package:get/get.dart';
import 'package:sazzon/feature/user/domain/usecase/get_user_usecase.dart';
import 'get_event.dart';
import 'get_state.dart';

class GetUserController extends GetxController {
  final GetUserUsecase getUserUsecase;
  var state = Rx<CreateGetState>(userInitial());

  GetUserController({required this.getUserUsecase});

  fetchUserDetails(FetchuserDetailsEvent event) async {
    state.value = userLoading();
    try {
      var userDetails = await getUserUsecase.execute();
      state.value = PostsLoaded(userDetails);
      print("Detalles del usuario obtenidos");
    } catch (e) {
      state.value = userFetchingFailure(e.toString());
    }
  }
}
