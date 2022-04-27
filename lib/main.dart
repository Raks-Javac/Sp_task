import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:estate_project/src/locator.dart';
import 'package:estate_project/src/ui/main_platform.dart/mobile/main_mobile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: '.env');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setupLocator();
  runApp(ProviderApp(allProviders));
}
