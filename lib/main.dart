import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project_template/src/core/cache/gen_cache.dart';
import 'package:flutter_project_template/src/locator.dart';
import 'package:flutter_project_template/src/ui/main_platform.dart/main_mobile.dart';
import 'package:flutter_project_template/src/ui/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  // ignore: avoid_print
  print(dotenv.env['API_URL']);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setupLocator();
  runApp(ProviderApp(allProviders));
}
