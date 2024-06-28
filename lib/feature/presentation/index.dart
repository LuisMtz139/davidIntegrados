import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBDCEA1), // Agrega el color de fondo
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get the screen size
          final screenHeight = MediaQuery.of(context).size.height;
          final screenWidth = MediaQuery.of(context).size.width;

          if (constraints.maxWidth > 600) {
            // Layout for larger screens
            return Stack(
              children: [
                Positioned(
                  top: screenHeight * 0.05, // 5% from top
                  left: 0, // Alinea el botón con el borde izquierdo
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(20)),
                        child: Container(
                          color: Colors.black,
                          width: screenWidth *
                              0.3, // Ajusta el ancho del contenedor según necesites
                          height:
                              50, // Ajusta la altura del contenedor según necesites
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                // Acción del botón Registrarse
                              },
                              child: Text(
                                'Registrarse',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Espacio entre el botón y el texto
                      Text(
                        'SEZZON',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.05, // 5% from bottom
                  left: 0, // Alinea el botón con el borde izquierdo
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(20)),
                    child: Container(
                      color: Colors.black,
                      width: screenWidth *
                          0.3, // Ajusta el ancho del contenedor según necesites
                      height:
                          50, // Ajusta la altura del contenedor según necesites
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            // Acción del botón Iniciar Sesión
                          },
                          child: Text(
                            'Iniciar Sesión',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Nueva imagen
                Positioned(
                  top: screenHeight * 0.35, // Centra la imagen verticalmente
                  right: -screenWidth *
                      0.25, // Coloca la imagen fuera de la vista inicialmente
                  child: Image.asset(
                    'assets/images/plato madera.png', // Ruta de la imagen
                    width: screenWidth *
                        0.6, // Ajusta el tamaño de la imagen según necesites
                    height: screenHeight *
                        0.6, // Ajusta el tamaño de la imagen según necesites
                  ),
                ),
              ],
            );
          } else {
            // Layout for smaller screens
            return Stack(
              children: [
                Positioned(
                  top: screenHeight * 0.06, // 6% from top
                  left: 0, // Alinea el botón con el borde izquierdo
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(20)),
                        child: Container(
                          color: Colors.black,
                          width: screenWidth *
                              0.5, // Ajusta el ancho del contenedor según necesites
                          height:
                              50, // Ajusta la altura del contenedor según necesites
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                // Acción del botón Registrarse
                              },
                              child: Text(
                                'Registrarse',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 40), // Espacio entre el botón y el texto
                      Column(
                        children: [
                          Text(
                            'SEZZON',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                              height: 40), // Espacio entre el texto y la imagen
                          Image.asset(
                            'assets/images/Gerbera-PNG-amarilla.png',
                            width: 145,
                            height: 140,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.03, // 3% from bottom
                  left: 0, // Alinea el botón con el borde izquierdo
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(20)),
                    child: Container(
                      color: Colors.black,
                      width: screenWidth *
                          0.5, // Ajusta el ancho del contenedor según necesites
                      height:
                          50, // Ajusta la altura del contenedor según necesites
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            // Acción del botón Iniciar Sesión
                          },
                          child: Text(
                            'Iniciar Sesión',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Nueva imagen
                Positioned(
                  top: screenHeight * 0.099, // Centra la imagen verticalmente
                  left: -screenWidth *
                      0.110, // Coloca la imagen fuera de la vista inicialmente
                  child: Image.asset(
                    'assets/images/plato madera.png', // Ruta de la imagen
                    width: screenWidth *
                        2, // Ajusta el tamaño de la imagen según necesites
                    height: screenHeight *
                        1, // Ajusta el tamaño de la imagen según necesites
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.05, // Debajo del botón de registrarse
                  left: -screenWidth *
                      0.3, // Coloca la imagen fuera de la vista inicialmente
                  child: Transform.rotate(
                    angle: 30, // Rotación de la imagen en grados
                    child: Image.asset(
                      'assets/images/wooden-rolling-pin-png.png', // Ruta de la imagen
                      width: screenWidth *
                          0.7, // Ajusta el tamaño de la imagen según necesites
                      height: screenHeight *
                          0.5, // Ajusta el tamaño de la imagen según necesites
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight *
                      0.45, // Ajusta esto para centrar el texto verticalmente
                  left: screenWidth * 0.50 -
                      160, // Centra el texto horizontalmente
                  child: Container(
                    width: 200, // Ancho del contenedor del texto
                    child: Text(
                      '“Ordena sin piedad que aquí te vamos a cuidar...”',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
