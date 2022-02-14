import 'package:estate_project/src/core/view_model/base_model.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final getIt = GetIt.instance;

Future setupLocator() async {
//this registers the dialog service
  // getIt.registerLazySingleton(() => DialogServices());

  //shared preference class registered
  // var instance = await LocalStorageService.getInstance();
  // locator.registerSingleton<LocalStorageService>(instance);
  //naviagtion services class registered

  // getIt.registerLazySingleton(() => NavigationService());

  getIt.registerFactory(() => BaseModel());
}

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BaseModel()),
];
