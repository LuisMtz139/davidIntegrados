import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveScreen(),
    );
  }
}

class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFBDCEA1), // Fondo de color BDCEA1
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 2 -
                  145, // Centra la imagen verticalmente
              left:
                  170, // Ajusta esta posición para mover la imagen hacia la derecha
              child: Container(
                width: 450,
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/plato madera.png"), // Ruta de la nueva imagen
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60, // Ajusta esta posición para mover el botón hacia abajo
              left: 0,
              right: 0,
              child: Row(
                children: [
                  _buildRegisterButton(context),
                  SizedBox(width: 60), // Espacio entre el botón y el texto
                  Text(
                    'SEZZON',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 120, // Ajusta esta posición para mover la imagen hacia abajo
              right:
                  200, // Ajusta esta posición para mover la imagen hacia la derecha
              child: Transform.rotate(
                angle:
                    1.5, // Rota la imagen en radianes (por ejemplo, 0.5 radianes es aproximadamente 28.6 grados)
                child: Container(
                  width: 324, // Ancho de la imagen
                  height: 312, // Altura de la imagen
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/wooden-rolling-pin-png.png"), // Ruta de la imagen local
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 450, // Baja el texto hacia abajo
              left: 40, // Ajusta esta posición para colocar el texto
              child: Container(
                width: 300, // Ancho del contenedor del texto
                child: Text(
                  "\"Ordena sin piedad que aquí te vamos a cuidar...\"",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom:
                  20, // Ajusta esta posición para mover el botón hacia arriba
              left: 0,
              right: 0,
              child: Row(
                children: [
                  _buildLoginButton(context),
                ],
              ),
            ),
            Positioned(
              top:
                  130, // Ajusta esta posición para colocar la imagen debajo de "SEZZON"
              left: 260, // Ajusta esta posición según sea necesario
              child: Container(
                width: 130,
                height: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/Gerbera-PNG-amarilla.png"), // Ruta de la imagen local
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.5, // Ajusta el ancho del botón según sea necesario
      child: ElevatedButton(
        onPressed: () {
          // Añade tu código aquí para el onPressed
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(18.0),
              bottomRight: Radius.circular(18.0),
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Registrarse',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.5, // Ajusta el ancho del botón según sea necesario
      child: ElevatedButton(
        onPressed: () {
          // Añade tu código aquí para el onPressed
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(18.0),
              bottomRight: Radius.circular(18.0),
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Iniciar sesión',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
