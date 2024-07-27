import 'package:flutter/material.dart';
import 'package:sazzon/feature/menu/presentation/Menu/getMenuCOntroller.dart';
import 'package:sazzon/feature/menu/presentation/MenuID/getMenuIdCOntroller.dart';
import 'package:sazzon/feature/user/presentation/Getx/RegisterUser/registerUserCOntroller.dart';
import 'package:sazzon/feature/user/presentation/pages/iniciarSeion.dart';
import 'package:sazzon/feature/user/presentation/pages/registro.dart';
import 'package:sazzon/feature/user/presentation/index.dart';
import 'package:sazzon/menucase_config.dart';
import 'package:sazzon/usercase_config.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'feature/menu/presentation/menudeorueba.dart';

UsercaseConfig usercaseConfig = UsercaseConfig();
MenucaseConfig menucaseConfig = MenucaseConfig();
void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  MyApp() {
    Get.put(CreatePostController(registerUserUseCase: usercaseConfig.registerUserUseCase!));
    Get.put(GetMenuController(getMenuUseCase: menucaseConfig.getMenuUseCase!));
    Get.put(GetMenuIdController(getMenuIdUseCase: menucaseConfig.getMenuidUseCase!));

  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage()//MyHomePage(),
    );
  }
}
