import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  /// Get string value
  /// Argument [key]
  Future<String?> getString(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String? _res = prefs.getString("$key");
    return _res;
  }

  //remove
  dynamic removeJson(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.remove("$key");
  }

  /// Get list or object
  /// Use import 'dart:convert'; for jsonEncode
  /// Argument [key]
  dynamic getJson(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String? jsonString = prefs.getString("$key");
    var _res = jsonDecode(jsonString!);
    return _res;
  }

  /// Adding a string value
  Future<bool> putString(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.setString("$key", val);
    return _res;
  }

  /// Adding a list or object
  /// Use import 'dart:convert'; for jsonEncode
  dynamic putJson(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var valString = jsonEncode(val);
    var _res = prefs.setString("$key", valString);
    return _res;
  }

  dynamic clearPref() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var _res = prefs.clear();
    return _res;
  }
}
