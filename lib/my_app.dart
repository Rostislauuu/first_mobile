import 'package:flutter/material.dart';

import 'package:first_app/pages/feed/feed.dart';
import 'package:first_app/pages/welcome_page/welcome_page.dart';
import 'package:first_app/pages/add_user/add_user.dart';
import 'package:first_app/pages/feed/expand-feed-item/expand_feed_item.dart';
import 'package:first_app/pages/charts/charts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => WelcomePage(),
        '/feed': (context) => Feed(),
        '/feed_item': (context) => ExpandFeedItem(),
        '/add_user': (context) => AddUser(),
        '/charts': (context) => Charts(),
      },
    );
  }
}
