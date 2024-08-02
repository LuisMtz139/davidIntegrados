import 'package:get/get.dart';
import 'package:sazzon/feature/Platillos/domain/usecase/posh_platillos__usecase.dart';

import 'register_event.dart';
import 'register_state.dart';

class CreatePlatillosController extends GetxController {
  final PoshPlatilllosUsecase poshPlatilllosUsecase;
  var state = Rx<CreatePostState>(PlatillosInitial());
  CreatePlatillosController({required this.poshPlatilllosUsecase});
  createPlatillos(CreatePlatillosEvent event) async {
    state.value = PlatillosLoading();
    try {
      await poshPlatilllosUsecase.execute(event.platillosModel);
      print("object");
      state.value = PlatillosCreatedSuccessfully();
    } catch (e) {
      state.value = PlatillosCreationFailure(e.toString());
    }
  }
}