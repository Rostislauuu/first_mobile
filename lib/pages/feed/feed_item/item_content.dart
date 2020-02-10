import 'package:flutter/material.dart';

class ItemContent extends StatelessWidget {
  final String name;
  final String direction;

  ItemContent({@required this.name, @required this.direction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Inconsolata',
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              direction,
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
