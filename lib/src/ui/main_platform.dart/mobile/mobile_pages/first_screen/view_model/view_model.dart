import 'dart:async';

import 'package:estate_project/src/core/base/base_view_model/b_vm.dart';
import 'package:flutter/material.dart';

class FirstScreenViewModel extends BaseViewModel {
  final BuildContext? context;
  FirstScreenViewModel({this.context});

  startLoading() {
    changeLoaderStatus(true);
    Future.delayed(const Duration(seconds: 4), () {
      changeLoaderStatus(false);
    });
  }

  @override
  FutureOr<void> disposeState() {}

  @override
  FutureOr<void> initState() {}
}
