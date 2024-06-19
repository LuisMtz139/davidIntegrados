import 'package:flutter/material.dart';
import 'package:sazzon/feature/presentation/pages/inicio.dart';
import 'package:sazzon/feature/presentation/pages/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
