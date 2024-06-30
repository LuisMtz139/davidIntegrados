import 'package:flutter/material.dart';
import 'package:sazzon/feature/admin/header.dart';
// import 'package:sazzon/feature/presentation/pages/inicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Header(),
    );
  }
}
