import 'package:flutter/material.dart';

bool validateAndSaveForm(GlobalKey<FormState> formKey) {
  FormState? currentState = formKey.currentState;
  if (currentState != null) {
    if (!currentState.validate()) return false;

    currentState.save();
    return true;
  }
  return false;
}

bool validateEmail(String input) {
  Pattern emailPattern =
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
  return RegExp(emailPattern.toString(), caseSensitive: false).hasMatch(input);
}

String adjustPhone(String phoneNumber) {
  phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
  if (phoneNumber.startsWith('234')) {
    return '0${phoneNumber.substring(3)}';
  } else if (phoneNumber.startsWith('0')) {
    return phoneNumber;
  }
  return phoneNumber;
}


String? validatePassword(String password) {
  if(password.length < 8) {
    return "Password must be at least 8 characters";
  }

  if(!password.contains(RegExp(r'[A-Z]'))) {
    return "Password must contain at least an uppercase character";
  }

  if(!password.contains(RegExp(r'[a-z]'))) {
    return "Password must contain at least an lowercase character";
  }

  if(!password.contains(RegExp(r'[0-9]'))) {
    return "Password must contain at least one number";
  }

  if(!password.contains(RegExp(r'[^a-zA-Z0-9]'))) {
    return "Password must contain at least one symbol";
  }

  return null;
}
