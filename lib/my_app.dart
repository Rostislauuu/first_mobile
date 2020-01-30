import 'package:first_app/pages/feed/feed.dart';
import 'package:first_app/pages/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => WelcomePage(),
        '/feed': (context) => Feed(),
      },
    );
  }
}
