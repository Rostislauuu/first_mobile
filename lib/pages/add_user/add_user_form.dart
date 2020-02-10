import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import './add_user_text_field.dart';
import './validators.dart';
import './generate_subdirections.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _addUserKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {
    'fullName': null,
    'birthday': null,
    'direction': 'Front-end',
    'subdirection': 'React.js',
    'email': null,
    'phone': null
  };

  final phoneKeyboardType = TextInputType.phone;
  final emailKeyboardType = TextInputType.emailAddress;
  final textKeyboardType = TextInputType.text;
  final birthdayKeyboardType = TextInputType.datetime;

  void handleSaveField(String fieldName, String value) {
    setState(() {
      formData[fieldName] = value;
    });
  }

  void postFormData() {
    String _url = 'https://test-api-vakoms.herokuapp.com/users/';
    Dio _dio = new Dio();

    _dio.post(_url, data: formData);
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
                  handleValidate: validateTextField,
                  keyboardType: textKeyboardType,
                ),
                UserTextField(
                  fieldName: 'birthday',
                  handleSaveField: handleSaveField,
                  handleValidate: validateTextField,
                  keyboardType: birthdayKeyboardType,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: DropdownButton<String>(
                    value: formData['direction'],
                    icon: Icon(Icons.arrow_downward),
                    iconEnabledColor: Colors.white,
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        formData['direction'] = newValue;
                        formData['subdirection'] = userDirectionData[newValue][0];
                      });
                    },
                    items: <String>['Front-end', 'Back-end', 'Mobile', 'Design', 'Stuff', 'QA']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: DropdownButton<String>(
                    value: formData['subdirection'],
                    icon: Icon(Icons.arrow_downward),
                    iconEnabledColor: Colors.white,
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        formData['subdirection'] = newValue;
                      });
                    },
                    items: handleGenerateSubdirections(formData['direction']),
                  ),
                ),
                UserTextField(
                  fieldName: 'email',
                  handleSaveField: handleSaveField,
                  handleValidate: validateEmailField,
                  keyboardType: emailKeyboardType,
                ),
                UserTextField(
                  fieldName: 'phone',
                  handleSaveField: handleSaveField,
                  handleValidate: validatePhoneField,
                  keyboardType: phoneKeyboardType,
                ),
                Container(
                  width: 120,
                  height: 45,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: RaisedButton(
                    color: Colors.blue[700],
                    onPressed: () {
                      if (_addUserKey.currentState.validate()) {
                        _addUserKey.currentState.save();
                        postFormData();
                        _addUserKey.currentState.reset();

                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${formData['fullName']} successfuly added'),
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
