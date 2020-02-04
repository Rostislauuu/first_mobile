import 'package:flutter/material.dart';

import 'package:first_app/drawer_content/drawer_content_item.dart';

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Center(
            child: Text(
              'Navigation',
              style: TextStyle(
                fontFamily: 'Inconsolata',
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue[800],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              DrawerContentItem(
                  listItemText: 'Users',
                  listItemIcon: Icons.collections,
                  handleNavigate: () =>
                      Navigator.popAndPushNamed(context, '/feed')),
              DrawerContentItem(
                listItemText: 'Add User',
                listItemIcon: Icons.add,
                handleNavigate: () =>
                    Navigator.popAndPushNamed(context, '/add_user'),
              ),
              DrawerContentItem(
                listItemText: 'HELLLLO',
                listItemIcon: Icons.email,
              ),
            ],
          ),
        )
      ],
    );
  }
}
