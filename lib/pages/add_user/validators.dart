String validateTextField(String value) {
  if (value.isEmpty) {
    return 'Field is empty';
  } else if (value.length < 2) {
    return 'Enter at least 2 letters';
  } else {
    return null;
  }
}

String validateEmailField(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}

String validatePhoneField(String value) {
  if (value.length != 10)
    return 'Enter 10 numbers';
  else
    return null;
}
