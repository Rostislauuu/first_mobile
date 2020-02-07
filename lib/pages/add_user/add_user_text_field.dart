import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  final String fieldName;
  final Function handleSaveField;

  UserTextField({@required this.fieldName, this.handleSaveField});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.5,
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 15),
          hintText: 'Enter ${fieldName[0].toUpperCase()}${fieldName.substring(1)}',
          hintStyle: TextStyle(
            color: Colors.grey[700],
            fontSize: 15,
          ),
          contentPadding: const EdgeInsets.all(10),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
        ),
        onSaved: (String value) => handleSaveField(fieldName, value),
        validator: (String fieldName) => fieldName.isEmpty ? 'Empty field' : null,
      ),
    );
  }
}
