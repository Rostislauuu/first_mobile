import 'package:flutter/material.dart';

import '../../../model/users/user.dart';

class ExpandItemContent extends StatelessWidget {
  final User user;

  ExpandItemContent({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                user.direction,
                style: TextStyle(
                  fontFamily: 'Courgette',
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                user.subdirection,
                style: TextStyle(
                  fontFamily: 'Courgette',
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
