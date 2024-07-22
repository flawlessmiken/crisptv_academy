import 'package:cripstv_academy/core/api/services/account_service.dart';
import 'package:cripstv_academy/core/api/services/job_service.dart';
import 'package:get_it/get_it.dart';

import 'core/api/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  locator.registerLazySingleton<UserService>(() => UserServiceImpl());
  locator.registerLazySingleton<AccountService>(() => AccountServiceImpl());
  locator.registerLazySingleton<JobService>(() => JobServiceImpl());
}
