import 'package:flutter/material.dart';

class ItemAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 15,
        backgroundColor: Colors.white,
        child: Image(
          image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD9_D9-tE-v5kODeqhk4jCPXxpK-nZVxShQ1UsOscVmi8t5Kp6sg&s',
          ),
        ));
  }
}
