import 'package:flutter/material.dart';

import 'package:sazzon/feature/menu/presentation/direccion_no_encontrada.dart';
import 'package:sazzon/commentcase_config.dart';
import 'package:sazzon/feature/menu/presentation/getX/Comment/getcommentCOntroller.dart';
import 'package:sazzon/feature/menu/presentation/getX/Comment/poshCOntroller.dart';
import 'package:sazzon/feature/menu/presentation/getX/Menu/getMenuCOntroller.dart';
import 'package:sazzon/feature/menu/presentation/getX/MenuID/getMenuIdCOntroller.dart';
import 'package:sazzon/feature/user/presentation/Getx/RegisterUser/registerUserCOntroller.dart';
import 'package:sazzon/menucase_config.dart';
import 'package:sazzon/usercase_config.dart';
import 'package:get/get.dart';

UsercaseConfig usercaseConfig = UsercaseConfig();
MenucaseConfig menucaseConfig = MenucaseConfig();
CommentcaseConfig commentcaseConfig = CommentcaseConfig();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    Get.put(CreatePostController(
        registerUserUseCase: usercaseConfig.registerUserUseCase!));
    Get.put(GetMenuController(getMenuUseCase: menucaseConfig.getMenuUseCase!));
    Get.put(GetMenuIdController(
        getMenuIdUseCase: menucaseConfig.getMenuidUseCase!));
    Get.put(GetMenuIdController(
        getMenuIdUseCase: menucaseConfig.getMenuidUseCase!));
    Get.put(GetCommentController(
        getCommentUseCase: commentcaseConfig.getCommentUseCase!));
    Get.put(PoshCommentController(
        poshcommentUseCase: commentcaseConfig.poshcommentUseCase!));
  }

  @override
  Widget build(BuildContext context) {
    //BarMenu
    return const GetMaterialApp(home: DireccionNoEncontrada() //MyHomePage(),
        );
  }
}
