
import 'package:estate_project/src/ui/main_platform.dart/mobile/mobile_pages/first_screen/view_model/view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/services/navigation_services.dart';


final getIt = GetIt.instance;

Future setupLocator() async {
//register your class and singletons here

  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => FirstScreenViewModel());
}

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (context) => FirstScreenViewModel()),
];


// FirstScreenViewModel