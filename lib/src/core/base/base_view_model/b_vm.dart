import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool _isDisposed = false;
  bool _isInitializeDone = false;

  bool get isLoading => _isLoading;
  bool get isDisposed => _isDisposed;
  bool get isInitialized => _isInitializeDone;

  FutureOr<void> _initState;

  BaseViewModel() {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _init();
      log("init called VM...");
    });
  }

  FutureOr<void> initState();
  FutureOr<void> disposeState();

  void _init() async {
    _initState = initState();
    await _initState;
    _isInitializeDone = true;
    initState();
  }

  changeState() {
    notifyListeners();
  }

  changeLoaderStatus(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    disposeState();
    super.dispose();
  }
}
