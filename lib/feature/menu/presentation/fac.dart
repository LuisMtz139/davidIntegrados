import 'package:flutter/material.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';

class Fac extends StatefulWidget {
  const Fac({super.key});

  @override
  State<Fac> createState() => _FacState();
}

class _FacState extends State<Fac> {
  final List<bool> _isExpanded = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      drawer: const BarMenu(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            const Text(
              "SEZZON",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Preguntas\nfrecuentes',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 80),
              ..._buildFAQItems(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFAQItems() {
    List<String> questions =
        List.filled(4, '¿Dónde y cuándo se realizan entregas?');
    List<String> answers = [
      'Haz tu pedido de lunes a viernes hasta las 23:59h y recíbelo el domingo.\n\nEl horario de reparto es de 9:00 a 15:00h.\n\nImportante: Los días festivos pueden sufrir cambios debido a días festivos locales y nacionales y/o huelgas de transporte u otras circunstancias.',
      'Haz tu pedido de lunes a viernes hasta las 23:59h y recíbelo el domingo.\n\nEl horario de reparto es de 9:00 a 15:00h.\n\nImportante: Los días festivos pueden sufrir cambios debido a días festivos locales y nacionales y/o huelgas de transporte u otras circunstancias.',
      'Haz tu pedido de lunes a viernes hasta las 23:59h y recíbelo el domingo.\n\nEl horario de reparto es de 9:00 a 15:00h.\n\nImportante: Los días festivos pueden sufrir cambios debido a días festivos locales y nacionales y/o huelgas de transporte u otras circunstancias.',
      'Haz tu pedido de lunes a viernes hasta las 23:59h y recíbelo el domingo.\n\nEl horario de reparto es de 9:00 a 15:00h.\n\nImportante: Los días festivos pueden sufrir cambios debido a días festivos locales y nacionales y/o huelgas de transporte u otras circunstancias.',
    ];

    return List.generate(questions.length, (index) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Text(
                questions[index],
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                _isExpanded[index] ? Icons.remove : Icons.add,
                color: Colors.white,
              ),
              onTap: () {
                setState(() {
                  _isExpanded[index] = !_isExpanded[index];
                });
              },
            ),
          ),
          if (_isExpanded[index])
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(answers[index]),
            ),
        ],
      );
    });
  }
}
