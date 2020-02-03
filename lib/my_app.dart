import 'package:flutter/material.dart';

import 'package:first_app/pages/feed/feed.dart';
import 'package:first_app/pages/welcome_page/welcome_page.dart';
import 'package:first_app/add_user/add_user.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => WelcomePage(),
        '/feed': (context) => Feed(),
        '/add_user': (context) => AddUser(),
      },
    );
  }
}