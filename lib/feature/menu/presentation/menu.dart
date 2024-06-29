import 'package:flutter/material.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';
import 'package:sazzon/feature/menu/presentation/platillo.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // Funcion para cambiar pantalla
  void navigateToSecondScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Platillo()),
    );
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(189, 206, 161, 1),
      drawer: const BarMenu(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Cambia el color del ícono aquí
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 0),
            const Text(
              "SEZZON",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/rama.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ads
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //  second box content
                    Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    // Imagen superpuesta con posición absoluta
                    Positioned(
                      left: 180,
                      top: 20,
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/pollo-removebg-preview.png',
                          width: 180,
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // box content black
                    Positioned(
                      left: 50, // Ajusta la posición en el eje X
                      top: 0, // Ajusta la posición en el eje Y
                      child: SizedBox(
                        width: 130, // Ancho del cuadro
                        height: 140, // Alto del cuadro
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: const TextSpan(
                              text: '"El pollo que\n conquista tú\n paladar',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // content
              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Alineación central horizontal
                    children: [
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6532A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Desayuno",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6532A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Comidas",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6532A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Cenas",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // eats
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        width: 176,
                        height: 191,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            navigateToSecondScreen(context);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/c.png',
                                  width: 100, // Ancho deseado para la imagen
                                  height: 101, // Alto deseado para la imagen
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10, bottom: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Brochetas de cerdo"),
                                    Text("450g"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 176,
                        height: 191,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            navigateToSecondScreen(context);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/c.png',
                                  width: 100, // Ancho deseado para la imagen
                                  height: 101, // Alto deseado para la imagen
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10, bottom: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Brochetas de cerdo"),
                                    Text("450g"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        width: 176,
                        height: 191,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            navigateToSecondScreen(context);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/c.png',
                                  width: 100, // Ancho deseado para la imagen
                                  height: 101, // Alto deseado para la imagen
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10, bottom: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Brochetas de cerdo"),
                                    Text("450g"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 176,
                        height: 191,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            navigateToSecondScreen(context);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/c.png',
                                  width: 100, // Ancho deseado para la imagen
                                  height: 101, // Alto deseado para la imagen
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10, bottom: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Brochetas de cerdo"),
                                    Text("450g"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        width: 176,
                        height: 191,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            navigateToSecondScreen(context);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/c.png',
                                  width: 100, // Ancho deseado para la imagen
                                  height: 101, // Alto deseado para la imagen
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10, bottom: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Brochetas de cerdo"),
                                    Text("450g"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 176,
                        height: 191,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            navigateToSecondScreen(context);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/c.png',
                                  width: 100, // Ancho deseado para la imagen
                                  height: 101, // Alto deseado para la imagen
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Center(
                                          child: Image.asset(
                                            'assets/star_1.png',
                                            width:
                                                20, // Ancho deseado para la imagen
                                            height:
                                                20, // Alto deseado para la imagen
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10, bottom: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Brochetas de cerdo"),
                                    Text("450g"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
