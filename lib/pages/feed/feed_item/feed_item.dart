import 'package:first_app/pages/feed/feed_item/item_avatar.dart';
import 'package:first_app/pages/feed/feed_item/item_content.dart';
import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ItemAvatar(),
          ItemContent(),
        ],
      ),
    );
  }
}
