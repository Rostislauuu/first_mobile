import 'package:flutter/material.dart';

import '../../../model/users/user.dart';
import './expand_item_avatar.dart';
import 'package:first_app/pages/feed/expand-feed-item/expand_item_content.dart';

class ExpandFeedItem extends StatelessWidget {
  final User user;
  final String heroTag;

  ExpandFeedItem({this.user, this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Scaffold(
        appBar: AppBar(
          title: Text(user.fullName),
        ),
        body: ListView(
          children: <Widget>[
            ExpandItemAvatar(),
            ExpandItemContent(
              user: user,
            ),
          ],
        ),
      ),
    );
  }
}
