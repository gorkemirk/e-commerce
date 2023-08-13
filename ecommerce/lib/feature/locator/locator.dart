import 'package:ecommerce/feature/repository/repository.dart';
import 'package:get_it/get_it.dart';

import '../service/databaseservice/firestoredatabase.dart';

GetIt locator = GetIt.instance;

class GetItLocator {
  static void setupLocator() {
    locator.registerLazySingleton(() => FireDatabase());
    locator.registerLazySingleton(() => ProductRepository());
  }
}
