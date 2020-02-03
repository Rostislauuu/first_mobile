import 'package:flutter/material.dart';

// https://flutter.dev/docs/cookbook/forms/validation INFO ABOUT FORMS HERE!!!!!
class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _addUserKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        title: Text('Add User'),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}
