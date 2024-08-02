import 'package:get/get.dart';
import 'package:sazzon/feature/Platillos/domain/usecase/get_platillos_usecase.dart';
import 'package:sazzon/feature/orden/domain/usecase/get_orden_usecase.dart';
import 'package:sazzon/feature/user/domain/usecase/get_user_usecase.dart';
import 'get_event.dart';
import 'get_state.dart';

class GetOrdenController extends GetxController {
  final GetOrdenUsecase getOrdenUsecase;
  var state = Rx<CreateGetState>(ordenInitial());

  GetOrdenController({required this.getOrdenUsecase});
  @override
  void onInit() {
    super.onInit();
    // Llamada inicial para cargar los datos cuando se inicia el controlador
    fetchOrdenDetails(FetchOrdenDetailsEvent());
  }
  fetchOrdenDetails(FetchOrdenDetailsEvent event) async {
    state.value = ordenLoading();
    try {
      var ordenDetails = await getOrdenUsecase.execute();
      state.value = PostsLoaded(ordenDetails);
       
      print("Detalles de platillos obtenidos");
    } catch (e) {
      state.value = ordenFetchingFailure(e.toString());
    }
  }
}
