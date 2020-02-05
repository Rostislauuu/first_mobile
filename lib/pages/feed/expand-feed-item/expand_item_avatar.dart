import 'package:flutter/material.dart';

class ExpandItemAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Image(
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width * 0.25,
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD9_D9-tE-v5kODeqhk4jCPXxpK-nZVxShQ1UsOscVmi8t5Kp6sg&s'),
        ),
      ),
    );
  }
}
