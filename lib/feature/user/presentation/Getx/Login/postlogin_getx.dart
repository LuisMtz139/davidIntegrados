import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sazzon/feature/user/data/models/user_models.dart';
import 'package:sazzon/feature/user/domain/usecase/login_user_usercase.dart';

import '../../../data/models/post_login.dart';

part 'postlogin_state.dart';
part 'postlogin_event.dart';

class LoginController extends GetxController {
  final LoginUserUsercase loginUserUsercase;

  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var userId = (-1).obs; // -1 indicates no user
  var errorMessage = ''.obs;

  LoginController({required this.loginUserUsercase});

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      LoginModel login = LoginModel(
        email: email,
        password: password,
      );
      userModel user = await loginUserUsercase.excute(login);
      userId.value = user.id!;
      isLoggedIn.value = true;
    } catch (e) {
      errorMessage.value = e.toString();
      isLoggedIn.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}