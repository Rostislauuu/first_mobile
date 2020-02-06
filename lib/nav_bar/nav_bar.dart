import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      margin: const EdgeInsets.only(bottom: 20),
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Tab(
            icon: Icon(
              Icons.pie_chart,
              color: Colors.blue[600],
              size: 35,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.insert_chart,
              color: Colors.blue[600],
              size: 35,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.show_chart,
              color: Colors.blue[600],
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
