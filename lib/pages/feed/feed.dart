import 'package:first_app/drawer_content/drawer_content.dart';
import 'package:first_app/pages/feed/feed_item/feed_item.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      drawer: Drawer(
        child: DrawerContent(),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        title: Text('Feed'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          color: Colors.white,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              FeedItem(),
              FeedItem(),
              FeedItem(),
              FeedItem(),
              FeedItem(),
              FeedItem(),
            ],
          ),
        ),
      ),
    );
  }
}
