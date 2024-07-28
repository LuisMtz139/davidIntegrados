import 'package:flutter/material.dart';

class DireccionRegistroDireccion extends StatefulWidget {
  const DireccionRegistroDireccion({Key? key}) : super(key: key);

  @override
  _DireccionRegistroDireccionState createState() =>
      _DireccionRegistroDireccionState();
}

class _DireccionRegistroDireccionState
    extends State<DireccionRegistroDireccion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: Text('SEZZÓN', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                _buildTextField('Dirección', 'Av. Central entre 2 y 3 poniente',
                    Colors.red),
                _buildTextField('Número Exterior', '#2322', Colors.red),
                _buildTextField('Número Interior (Opcional)', '', Colors.red),
                _buildTextField('Código Postal', '29000', Colors.red),
                _buildTextField('Ciudad', 'Chiapas', Colors.red),
                _buildTextField('Municipio', 'Suchiapa', Colors.red),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: Text('Guardar Dirección',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder, Color labelColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: labelColor),
          hintText: placeholder,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
