import 'package:get/get.dart';
import 'package:sazzon/feature/address/domain/usecase/posh_Coment_usecase.dart';
import 'package:sazzon/feature/address/presentation/getX/posh_event.dart';
import 'package:sazzon/feature/address/presentation/getX/posh_state.dart';


class PoshAddressController extends GetxController {
  final PoshaddressUseCase poshaddressUseCase;
  var state = Rx<CreatePostState>(AddressInitial());
  PoshAddressController({required this.poshaddressUseCase});
  createComment(CreateAddressEvent event) async {
    state.value = AddressLoading();
    try {
      await poshaddressUseCase?.execute(event.addressModel);
      print("object");
      state.value = AddressCreatedSuccessfully();
    } catch (e) {
      state.value = AddressCreationFailure(e.toString());
    }
  }
}