import 'package:flutter/material.dart';
import 'package:flutter_project_template/src/core/enums/view_state.dart';
import 'package:flutter_project_template/src/core/utils/functions.dart';

class BaseModel extends ChangeNotifier {
//loading function
  bool load = false;
  bool get loader => load;

  void setStringState(String? value, String? toValue) {
    value = toValue;
    notifyListeners();
    logConsole(value);
  }

  void setIntState(int? value, int? toValue) {
    value = toValue;
    notifyListeners();
    logConsole(value);
  }

  void setDynamicState(dynamic value, dynamic toValue) {
    value = toValue;
    notifyListeners();
    logConsole(value);
  }

  void changeLoadingState() {
    load = !load;
    notifyListeners();
    logConsole(load);
  }

  ViewState _enumViewState = ViewState.idle;
  ViewState get state => _enumViewState;

  setViewState(ViewState viewState) {
    _enumViewState = viewState;
    notifyListeners();
  }
}
