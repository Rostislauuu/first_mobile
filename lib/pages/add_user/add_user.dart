import 'package:flutter/material.dart';

import 'package:first_app/pages/add_user/add_user_form.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  // final _addUserKey = GlobalKey<FormState>();
  // final Map<String, dynamic> formData = {
  //   'fullName': null,
  //   'direction': null,
  //   'subdirection': null,
  // };

  // void handleSaveField(String fieldName, String value) {
  //   setState(() {
  //     formData[fieldName] = value;
  //   });
  // }

  // void postFormData(String url) {
  //   Response _response;
  //   Dio _dio = new Dio();

  //   _dio.post(url, data: formData);
  // }

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
