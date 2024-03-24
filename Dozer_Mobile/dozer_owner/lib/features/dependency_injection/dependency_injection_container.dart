import 'package:dozer_owner/core/network/network_info.dart';
import 'package:dozer_owner/features/dependency_injection/profile_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


GetIt sl = GetIt.instance;

Future<void> initDepInj() async {
  //
  await profileInj();

  //! Core - Network information
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  //! External -Dependencies
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}