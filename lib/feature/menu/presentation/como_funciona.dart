import 'package:flutter/material.dart';

class HowItWorks extends StatelessWidget {
  const HowItWorks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: Text('SEZZON', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Color(0xFFCFDCB2), // Color de fondo verde claro
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.50),
              child: Center(
                child: Text(
                  '¿Cómo funciona SEZZON?',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Imagen de fondo de madera
                  Positioned(
                    left: -MediaQuery.of(context).size.width * 0.2,
                    right: -MediaQuery.of(context).size.width * 0.2,
                    top: 0,
                    bottom: 0,
                    child: ClipPath(
                      clipper: WoodShapeClipper(),
                      child: Image.asset(
                        'assets/a.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Contenido sobre la imagen
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStep('Paso 1', Icons.restaurant_menu,
                            'Selecciona tus alimentos'),
                        SizedBox(height: 30),
                        _buildStep('Paso 2', Icons.local_shipping,
                            'Recibe tu pedido el domingo'),
                        SizedBox(height: 30),
                        _buildStep(
                            'Paso 3', Icons.microwave, 'Calienta en el horno'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String step, IconData icon, String description) {
    return Column(
      children: [
        Text(
          step,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        SizedBox(height: 10),
        Icon(icon, size: 70, color: Colors.black), // Cambio a color negro
        SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(
              fontSize: 18, color: Colors.black), // Cambio a color negro
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class WoodShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(-size.width * 0.1, 0);
    path.lineTo(-size.width * 0.1, size.height);
    path.lineTo(size.width * 1.1, size.height);
    path.lineTo(size.width * 1.1, 0);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.1, -size.width * 0.1, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
