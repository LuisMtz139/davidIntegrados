import 'package:flutter/material.dart';
import 'package:sazzon/feature/menu/presentation/bar_menu.dart';

class Platillo extends StatefulWidget {
  const Platillo({super.key});

  @override
  State<Platillo> createState() => _PlatilloState();
}

class _PlatilloState extends State<Platillo> {
  final _formKey = GlobalKey<FormState>();

  bool _showBurgerBar = false;

  void _toggleBurgerBar() {
    setState(() {
      _showBurgerBar = !_showBurgerBar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      drawer: Container(child: BarMenu()),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Cambia el color del ícono aquí
        ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // stars points
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 270, 0),
              child: Container(
                width: 250,
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
                          width: 20, // Ancho deseado para la imagen
                          height: 20, // Alto deseado para la imagen
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Center(
                        child: Image.asset(
                          'assets/star_1.png',
                          width: 20, // Ancho deseado para la imagen
                          height: 20, // Alto deseado para la imagen
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Center(
                        child: Image.asset(
                          'assets/star_1.png',
                          width: 20, // Ancho deseado para la imagen
                          height: 20, // Alto deseado para la imagen
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Center(
                        child: Image.asset(
                          'assets/star_1.png',
                          width: 20, // Ancho deseado para la imagen
                          height: 20, // Alto deseado para la imagen
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Center(
                        child: Image.asset(
                          'assets/star_1.png',
                          width: 20, // Ancho deseado para la imagen
                          height: 20, // Alto deseado para la imagen
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        height: 300,
                        decoration: const BoxDecoration(
                            // color: Colors.white,
                            // image: DecorationImage(
                            //   image: AssetImage('assets/c.png'),
                            // ),
                            ),
                        child: Column(
                          children: [
                            Container(
                              width: 180,
                              height: 180,
                              decoration: const BoxDecoration(
                                // color: Color.fromARGB(255, 255, 131, 131),
                                image: DecorationImage(
                                  image: AssetImage('assets/c.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 150,
                              height: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Brochetas de pollo',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(
                                    '\$66',
                                    style: TextStyle(
                                      fontSize: 24,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      Container(
                        width: 170,
                        height: 300,
                        decoration: const BoxDecoration(
                          color: Color(0xFF000000),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eu risus sit amet sem vehicula dignissim. Nunc condimentum ut magna aliquet laoreet. Nam et sodales eros.',
                              style: TextStyle(color: Color(0xFFBDCEA1)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // Boton
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 88,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF6532A),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.5),
                          child: Column(
                            children: [
                              Text(
                                "Añadir",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 32, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0), // Ajustar la altura
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(children: [
              Container(
                width: double.infinity,
                // height: double.minPositive,
                // height: double.infinity,

                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFFF6532A), // Color del borde superior
                      width: 6.0, // Ancho del borde superior
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text('¡Califica el platillo!'),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: const BoxDecoration(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 250,
                            // height: 70,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '• Please enter somer email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: const EdgeInsets.only(
                                    left: 10.0, top: 16.0),
                                hintText: '"Escribe un comentario"',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  // borderSide: BorderSide.,
                                ),
                                hintStyle: const TextStyle(color: Colors.black),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF6532A),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 13.0), // Ajustar la altura
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                            child: const Text('send', style: TextStyle(fontSize: 15, color: Colors.white),),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 330,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Arturo'),
                            SizedBox(height: 10),
                            Text(
                                "Las brochetas de pollo que probé en el restaurante fueron excepcionales. El pollo estaba perfectamente marinado y cocido a la perfección. Cada bocado era jugoso y lleno de sabor. Sin duda, volveré por más."),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 330,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Arturo'),
                            SizedBox(height: 10),
                            Text(
                                "Las brochetas de pollo que probé en el restaurante fueron excepcionales. El pollo estaba perfectamente marinado y cocido a la perfección. Cada bocado era jugoso y lleno de sabor. Sin duda, volveré por más."),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 330,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Arturo'),
                            SizedBox(height: 10),
                            Text(
                                "Las brochetas de pollo que probé en el restaurante fueron excepcionales. El pollo estaba perfectamente marinado y cocido a la perfección. Cada bocado era jugoso y lleno de sabor. Sin duda, volveré por más."),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
