import 'package:flutter/material.dart';
import 'package:proyecto_reciclar/src/pages/mapa_page.dart';
import 'package:proyecto_reciclar/src/widgets/custom_bottom_navigator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Proyecto Reciclar'),
        centerTitle: true,
      ),
      body: MapaPage(),
      bottomNavigationBar: CustomBottomNavigator(),
    );
  }
}
