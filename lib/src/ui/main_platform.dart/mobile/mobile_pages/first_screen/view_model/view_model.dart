import 'dart:async';

import 'package:estate_project/src/core/base/base_view_model/b_vm.dart';
import 'package:estate_project/src/core/services/navigation_services.dart';
import 'package:estate_project/src/ui/main_platform.dart/mobile/mobile_pages/other/other.dart';
import 'package:flutter/material.dart';

class FirstScreenViewModel extends BaseViewModel {
  final BuildContext? context;
  FirstScreenViewModel({this.context});

  startLoadingAndNavigateToNext() {
    changeLoaderStatus(true);
    Future.delayed(const Duration(seconds: 4), () {
      changeLoaderStatus(false);
      pushScreen(const SecondScreen());
    });
  }

  navigateBack() {
    popScreen();
  }

  @override
  FutureOr<void> disposeState() {}

  @override
  FutureOr<void> initState() {}
}
