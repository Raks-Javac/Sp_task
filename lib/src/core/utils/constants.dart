import 'dart:ui';

import 'package:flutter/material.dart';

class ConstantsStore {}

// stores strings
class StringsStore {
  static const String kAppName = "Fluutter Template";

  String emptyEmailField({String? fieldType = "Email"}) =>
      '$fieldType field cannot be empty!';
  static const String emptyPhoneNumber = "Phone number";
  static const String emptyTextField = 'Field cannot be empty!';
  static const String emptyPasswordField = 'Password field cannot be empty';
  static const String invalidEmailField =
      "Email provided isn't valid.Try another email address";
  static const String passwordLengthError =
      'Password length must be greater than 6';
  static const String emptyUsernameField = 'Username  cannot be empty';
  static const String usernameLengthError =
      'Username length must be greater than 6';
  static const String emailRegex = '[a-zA-Z0-9+._%-+]{1,256}' '\\@' +
      '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}' +
      '(' +
      '\\.' +
      '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}' +
      ')+';

  static const String phoneNumberRegex = r'0[789][01]\d{8}';

  static const String phoneNumberLengthError = 'Phone number must be 11 digits';

  static const String invalidPhoneNumberField =
      "Number provided isn't valid.Try another phone number";
}

//stores image constants
class ImageStore {}

//stores colors and all other
class ColorsTexStyleStore {
  static const Color kTriviaLightBlack = Color(0xFF222222);
  static const Color kTriviaYellow = Colors.yellow;
  static const Color kTriviaLightYellow = Color(0xFFF7E8AB);
  static Color kTriviaScaffoldBackground = Colors.grey.shade200;
  static const Color kTriviaLightGrey = Color(0xFFF1F3F4);
  static const Color deepGrey = Color(0xFFC4C4C4);
  static const Color kTriviaDarkGrey = Color(0xFFEAEAEA);
  static const Color kTriviaWhiteColor = Colors.white;
  static const Color kAppMainColor = Colors.green;
  static const Color kTriviaBlack = Colors.black;
  static const Color kTriviaRed = Color(0xFFB80016);
  static const Color kTriviaTransparentColor = Colors.transparent;
}
