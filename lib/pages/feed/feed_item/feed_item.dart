import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:first_app/pages/feed/feed_item/item_avatar.dart';
import 'package:first_app/pages/feed/feed_item/item_content.dart';
import 'package:first_app/pages/feed/expand-feed-item/expand_feed_item.dart';
import 'package:first_app/model/users/user.dart';

class FeedItem extends StatelessWidget {
  final User user;

  FeedItem({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ExpandFeedItem(
            user: user,
            heroTag: 'hero-item-${user.id}',
          );
        })),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: 'hero-item-${user.id}',
                child: ItemAvatar(),
              ),
              ItemContent(
                name: user.fullName,
                direction: user.direction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
