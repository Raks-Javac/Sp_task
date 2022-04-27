import 'dart:convert';

import 'package:flutter/material.dart';

class AppFunctions {
  logConsole(dynamic data) => debugPrint("$data");

  String removeFirstCharacter(dynamic value) {
    return value.toString().substring(1);
  }

  Map<dynamic, dynamic>? changeStringToMap(String data) {
    // remove all quotes from the string values
    final string2 = data.replaceAll("\"", "");

// now adding add quotes to both keys and Strings values
    final quotedString = string2.replaceAllMapped(RegExp(r'\b\w+\b'), (match) {
      return '"${match.group(0)}"';
    });

// decoding it as a normal json
    final decoded = jsonDecode(quotedString);

    return decoded;
  }
}

logConsole(dynamic data) => debugPrint("$data");

void closeTextFieldFocus(BuildContext context) {
  final currentFocus = FocusScope.of(context);
  FocusScope.of(context).unfocus();
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
    return;
  }
  currentFocus.unfocus();
}
