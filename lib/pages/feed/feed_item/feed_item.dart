import 'package:first_app/model/users/user.dart';
import 'package:flutter/material.dart';

import 'package:first_app/pages/feed/feed_item/item_avatar.dart';
import 'package:first_app/pages/feed/feed_item/item_content.dart';

class FeedItem extends StatelessWidget {
  final User user;

  FeedItem({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ItemAvatar(),
          ItemContent(
            name: user.fullName,
            direction: user.direction,
          ),
        ],
      ),
    );
  }
}
