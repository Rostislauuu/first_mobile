import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import './add_user_text_field.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _addUserKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {
    'fullName': null,
    'direction': null,
    'subdirection': null,
  };

  void handleSaveField(String fieldName, String value) {
    setState(() {
      formData[fieldName] = value;
    });
  }

  void postFormData(String url) {
    Dio _dio = new Dio();

    _dio.post(url, data: formData);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 1,
          child: Form(
            key: _addUserKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                UserTextField(
                  fieldName: 'fullName',
                  handleSaveField: handleSaveField,
                ),
                UserTextField(
                  fieldName: 'direction',
                  handleSaveField: handleSaveField,
                ),
                UserTextField(
                  fieldName: 'subdirection',
                  handleSaveField: handleSaveField,
                ),
                RaisedButton(
                  color: Colors.blue[700],
                  onPressed: () {
                    if (_addUserKey.currentState.validate()) {
                      _addUserKey.currentState.save();
                      postFormData('http://test-api-vakoms.herokuapp.com/users/');
                      _addUserKey.currentState.reset();

                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${formData['fullName']}  successfuly added'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
