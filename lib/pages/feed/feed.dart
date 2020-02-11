import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:first_app/pages/feed/feed_item/feed_item.dart';
import '../../model/users/user.dart';
import 'package:first_app/loading/loading.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<User> usersData;

  Future<List<User>> fetchUsersData() async {
    final String _usersAPI = 'https://test-api-vakoms.herokuapp.com/users/';
    Dio _dio = Dio();
    Response _response;

    try {
      _response = await _dio.get(_usersAPI);
      List<User> finalUsers = List<User>.from(_response.data.map((user) => User.fromJson(user)));

      return finalUsers;
    } catch (e) {
      throw Exception(e);
    }
  }

  void initUser() async {
    final List<User> response = await fetchUsersData();

    setState(() {
      usersData = response;
    });
  }

  void handleDeleteUser(String id) {
    final String _userToDelete = 'https://test-api-vakoms.herokuapp.com/users/$id';
    Dio _dio = Dio();

    try {
      _dio.delete(_userToDelete);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void initState() {
    super.initState();

    initUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        title: Text(
          'Feed',
          style: TextStyle(fontFamily: 'Inconsolata'),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          color: Colors.white,
          child: usersData != null
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: usersData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      background: Card(color: Colors.red),
                      key: Key(usersData[index].id),
                      onDismissed: (direction) {
                        handleDeleteUser(usersData[index].id);
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${usersData[index].fullName} deleted"),
                          ),
                        );
                      },
                      child: new FeedItem(user: usersData[index]),
                    );
                  },
                )
              : Loading(),
        ),
      ),
    );
  }
}
