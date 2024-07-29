import 'package:get/get.dart';
import 'package:sazzon/feature/address/domain/usecase/get_Coment_usecase.dart';
import 'package:sazzon/feature/address/presentation/getX/get_event.dart';
import 'package:sazzon/feature/address/presentation/getX/get_state.dart';


class GetAddressController extends GetxController {
  final GetAddressUseCase getAddressUseCase;
  var state = Rx<CreateGetState>(AddressInitial());
  GetAddressController({required this.getAddressUseCase});
  fetchCoDetails(FetchAddressDetailsEvent event) async {
    state.value = AddressLoading();
    try {
      var addressDetails = await getAddressUseCase.execute();
      state.value = PostsLoaded(addressDetails);
      print("Detalles del usuario obtenidos");
    } catch (e) {
      state.value = AddressFetchingFailure(e.toString());
    }
  }
}
