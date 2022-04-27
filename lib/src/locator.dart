import 'package:get_it/get_it.dart';
import 'package:provider/single_child_widget.dart';

import 'core/services/navigation_services.dart';

final getIt = GetIt.instance;

Future setupLocator() async {
//register your class and singletons here

  getIt.registerLazySingleton(() => NavigationService());
}

final allProviders = <SingleChildWidget>[];
