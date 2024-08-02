import 'package:get/get.dart';
import 'package:sazzon/feature/Platillos/domain/usecase/delite_platillo_usecase.dart';
import 'package:sazzon/feature/Platillos/domain/usecase/posh_platillos__usecase.dart';

import 'delite_event.dart';
import 'delite_state.dart';

class DelitePlatillosController extends GetxController {
  final DelitePlatilloUsecase delitePlatilloUsecase;
  var state = Rx<DelitePostState>(DeliteInitial());
  DelitePlatillosController({required this.delitePlatilloUsecase});
  delitePlatillos(DelitePlatillosEvent event) async {
    state.value = DeliteLoading();
    try {
      await delitePlatilloUsecase.execute(event.id);
      print("object");
      state.value = DelitePlatillosSuccessfully();
    } catch (e) {
      state.value = DelitePlatillosFailure(e.toString());
    }
  }
}