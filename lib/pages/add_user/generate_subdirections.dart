import 'package:flutter/material.dart';

final Map<String, dynamic> userDirectionData = {
  'Front-end': ['React.js', 'Angular.js', 'Vue.js'],
  'Back-end': ['Node.js', 'Java', 'Python'],
  'Mobile': ['Flutter', 'React Native', 'Ionic'],
  'Design': ['3D Artist', 'Designer'],
  'Stuff': ['Human Resources', 'English Teacher'],
  'QA': ['Automated Testing', 'Manual Testing']
};

List<DropdownMenuItem<String>> handleGenerateSubdirections(String direction) {
  List<DropdownMenuItem<String>> finalResult = [];

  userDirectionData.forEach((key, value) {
    if (key == direction) {
      value.map<DropdownMenuItem<String>>((String value) {
        finalResult.add(DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ));
      }).toList();
    }
  });

  return finalResult;
}
