import 'package:flutter/material.dart';
import 'package:sazzon/feature/presentation/pages/iniciarSeion.dart';
import 'package:sazzon/feature/presentation/pages/registro.dart';
import 'package:sazzon/feature/presentation/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
