import 'package:get/get.dart';
import 'package:sazzon/feature/Platillos/domain/usecase/get_platillos_usecase.dart';
import 'package:sazzon/feature/user/domain/usecase/get_user_usecase.dart';
import 'get_event.dart';
import 'get_state.dart';

class GetPlatillosController extends GetxController {
  final GetPlatillosUsecase getPlatillosUsecase;
  var state = Rx<CreateGetState>(platillosInitial());

  GetPlatillosController({required this.getPlatillosUsecase});

  fetchPlatilloDetails(FetchPlatillosDetailsEvent event) async {
    state.value = platillosLoading();
    try {
      var platillosDetails = await getPlatillosUsecase.execute();
      state.value = PostsLoaded(platillosDetails);
      print("Detalles de platillos obtenidos");
    } catch (e) {
      state.value = PlatillosFetchingFailure(e.toString());
    }
  }
}