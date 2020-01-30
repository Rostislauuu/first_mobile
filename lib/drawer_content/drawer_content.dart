import 'package:first_app/drawer_content/drawer_content_item.dart';
import 'package:flutter/material.dart';

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
                fontSize: 22,
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
                listItemText: 'Second List Item',
                listItemIcon: Icons.edit,
              ),
              DrawerContentItem(
                listItemText: 'Third List Item',
                listItemIcon: Icons.email,
              ),
            ],
          ),
        )
      ],
    );
  }
}
