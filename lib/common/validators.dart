import 'package:flutter/material.dart';

class ValidateFields{

  String validateEmail( String value , BuildContext context) {
    RegExp regExp =
    new RegExp(r"^([a-z A-Z0-9\\_\\-\\.]*)+@[a-zA-Z0-9\\_\\-]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return "Please Enter your email";
    } else if (!regExp.hasMatch(value)) {
      return "Please Enter a valid email";    }
    return null;
  }

  String validatePass( String value , BuildContext context) {
    String passPatern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}"
    ;

    RegExp regExp =
    new RegExp(passPatern);
    if (value.isEmpty) {
      return "Please Enter your password";
    }
    
    return null;
  }

}