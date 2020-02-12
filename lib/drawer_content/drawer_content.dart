import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:first_app/drawer_content/drawer_content_item.dart';
import 'package:first_app/pages/add_user/add_user.dart';
import 'package:first_app/pages/charts/charts.dart';
import 'package:first_app/pages/feed/feed.dart';

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
                handleNavigate: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) {
                      return Feed();
                    }),
                  );
                },
              ),
              DrawerContentItem(
                listItemText: 'Add User',
                listItemIcon: CupertinoIcons.person_add_solid,
                handleNavigate: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) {
                      return AddUser();
                    }),
                  );
                },
              ),
              DrawerContentItem(
                listItemText: 'Charts',
                listItemIcon: Icons.insert_chart,
                handleNavigate: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) {
                      return Charts();
                    }),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
