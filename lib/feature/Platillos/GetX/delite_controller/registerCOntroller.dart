import 'package:get/get.dart';
import 'package:sazzon/feature/Platillos/domain/usecase/delite_platillo_usecase.dart';
import 'package:sazzon/feature/Platillos/domain/usecase/posh_platillos__usecase.dart';

import 'register_event.dart';
import 'register_state.dart';

class DelitePlatillosController extends GetxController {
  final DelitePlatilloUsecase delitePlatilloUsecase;
  var state = Rx<CreatePostState>(PlatillosInitial());
  DelitePlatillosController({required this.delitePlatilloUsecase});
  createPlatillos(CreatePlatillosEvent event) async {
    state.value = PlatillosLoading();
    try {
      await delitePlatilloUsecase.execute(event.id);
      print("object");
      state.value = PlatillosCreatedSuccessfully();
    } catch (e) {
      state.value = PlatillosCreationFailure(e.toString());
    }
  }
}