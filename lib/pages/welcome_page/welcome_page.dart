import 'package:flutter/material.dart';

import 'package:first_app/drawer_content/drawer_content.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 270,
      drawer: Drawer(
        child: DrawerContent(),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.blue[800],
      body: Container(
        child: Center(
          child: Text(
            'Welcome to my App',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48,
              letterSpacing: 1.5,
              fontFamily: 'Courgette',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
