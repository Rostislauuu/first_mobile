import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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

  final FocusNode _fullNameFocus = FocusNode();
  final FocusNode _birthdayFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

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
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 15),
                      hintText: 'Enter Full Name',
                      hintStyle: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSaved: (String value) => handleSaveField('fullName', value),
                    validator: validateTextField,
                    focusNode: _fullNameFocus,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _fullNameFocus, _birthdayFocus);
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 15),
                      hintText: 'Enter Birthday Date',
                      hintStyle: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSaved: (String value) => handleSaveField('birthday', value),
                    validator: validateTextField,
                    focusNode: _birthdayFocus,
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _birthdayFocus, _emailFocus);
                    },
                  ),
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
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 15),
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSaved: (String value) => handleSaveField('email', value),
                    validator: validateEmailField,
                    focusNode: _emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _emailFocus, _phoneFocus);
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 15),
                      hintText: 'Enter Phone Number',
                      hintStyle: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSaved: (String value) => handleSaveField('phone', value),
                    validator: validatePhoneField,
                    focusNode: _phoneFocus,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (String value) {
                      _phoneFocus.unfocus();
                    },
                  ),
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
