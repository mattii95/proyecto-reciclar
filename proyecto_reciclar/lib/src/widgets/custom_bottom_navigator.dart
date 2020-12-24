import 'package:flutter/material.dart';

class CustomBottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline_rounded),
          label: 'Info',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_sharp),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pages),
          label: 'Noticias',
        ),
      ],
    );
  }
}
