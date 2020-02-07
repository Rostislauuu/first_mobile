import 'package:flutter/material.dart';

import 'package:first_app/pages/add_user/add_user_form.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        title: Text(
          'Add User',
          style: TextStyle(fontFamily: 'Inconsolata'),
        ),
      ),
      body: UserForm(),
    );
  }
}
