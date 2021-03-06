import 'package:flutter/material.dart';

class DrawerContentItem extends StatelessWidget {
  final Function handleNavigate;
  final String listItemText;
  final IconData listItemIcon;

  DrawerContentItem({
    @required this.listItemText,
    @required this.listItemIcon,
    @required this.handleNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      color: Colors.cyan,
      height: 60,
      child: FlatButton(
        onPressed: handleNavigate,
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: Icon(
                listItemIcon,
                color: Colors.white,
              ),
            ),
            Text(
              listItemText,
              style: TextStyle(
                fontFamily: 'Inconsolata',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
