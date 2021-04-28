

import 'package:get_it/get_it.dart';
import 'package:lavaloon/services/utlites_services.dart';

import 'common/validators.dart';

final locator = GetIt.instance;

void setupLocator() {

  locator.registerLazySingleton(()=>ValidateFields());
  locator.registerLazySingleton(()=>UtilitiesService());
}