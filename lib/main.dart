import 'package:flutter/material.dart';
import 'package:sazzon/feature/user/presentation/Getx/RegisterUser/registerUserCOntroller.dart';
import 'package:sazzon/feature/user/presentation/pages/iniciarSeion.dart';
import 'package:sazzon/feature/user/presentation/pages/registro.dart';
import 'package:sazzon/feature/user/presentation/index.dart';
import 'package:sazzon/usercase_config.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

UsercaseConfig usercaseConfig = UsercaseConfig();
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final UsercaseConfig usercaseConfig = UsercaseConfig();

  MyApp() {
    Get.put(CreatePostController(registerUserUseCase: usercaseConfig.registerUserUseCase!));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
    );
  }
}
