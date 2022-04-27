import 'package:flutter/material.dart';
import 'package:estate_project/src/core/services/navigation_services.dart';
import 'package:estate_project/src/core/utils/constants.dart';
import 'package:estate_project/src/core/utils/styles.dart';
import 'package:estate_project/src/locator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'mobile_pages/first_screen/first_screen.dart';

class ProviderApp extends StatefulWidget {
  final List<SingleChildWidget> multiProvider;
  const ProviderApp(this.multiProvider);

  @override
  _ProviderAppState createState() => _ProviderAppState();
}

class _ProviderAppState extends State<ProviderApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: MaterialApp(
        color: ColorsTexStyleStore.kAppMainColor,

        scaffoldMessengerKey: getIt<NavigationService>().scaffoldKey,
        navigatorKey: getIt<NavigationService>().navigationKey,
        debugShowCheckedModeBanner: false,
        title: StringsStore.kAppName,
        theme: ThemeHandler.lightMode,
        // home:  const TestApi(),
        home: const FirstScreen(),
      ),
    );
  }
}
