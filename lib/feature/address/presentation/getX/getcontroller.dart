import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/address/domain/usecase/get_ddress_usecase.dart';
import 'package:sazzon/feature/address/presentation/getX/get_event.dart';
import 'package:sazzon/feature/address/presentation/getX/get_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAddressController extends GetxController {
  final GetAddressUseCase getAddressUseCase;
  var state = Rx<CreateGetState>(AddressInitial());

  GetAddressController({required this.getAddressUseCase});

  fetchCoDetails() async {
    state.value = AddressLoading();
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId');
      print("userId obtenido: $userId");

      if (userId != null) {
        var addressDetails = await getAddressUseCase.execute(userId);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (addressDetails.isEmpty) {
            state.value =
                AddressFetchingFailure("No hay ninguna dirección registrada.");
          } else {
            state.value = PostsLoaded(addressDetails);
          }
        });
        print("Detalles de la dirección obtenidos");
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state.value = AddressFetchingFailure("ID de usuario no encontrado");
        });
        print("User ID no encontrado en el almacenamiento local");
      }
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        state.value = AddressFetchingFailure(e.toString());
      });
    }
  }
}
