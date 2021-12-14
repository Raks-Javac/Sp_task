import 'package:flutter/material.dart';
import 'package:flutter_project_template/src/core/services/navigation_services.dart';
import 'package:flutter_project_template/src/core/utils/constants.dart';
import 'package:flutter_project_template/src/core/utils/styles.dart';
import 'package:flutter_project_template/src/locator.dart';
import 'package:flutter_project_template/src/ui/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderApp extends StatefulWidget {
  final List<SingleChildWidget> multiProvider;
  ProviderApp(this.multiProvider);

  @override
  _ProviderAppState createState() => _ProviderAppState();
}

class _ProviderAppState extends State<ProviderApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: MaterialApp(
        color: ColorsTexStyleStore.kTriviaGreenColor,
        // builder: (context, widget) => Navigator(
        //   onGenerateRoute: (settings) => MaterialPageRoute(
        //       builder: (context) => DialogManager(child: widget)),
        // ),
        scaffoldMessengerKey: getIt<NavigationService>().scaffoldKey,
        navigatorKey: getIt<NavigationService>().navigationKey,
        debugShowCheckedModeBanner: false,
        title: StringsStore.kAppName,
        theme: ThemeHandler.lightMode,
        // home:  const TestApi(),
        home: const MainScreen(),
      ),
    );
  }
}
