// import 'package:dozer_owner/features/owner_profile/domain/repositories/owner_repository.dart';
// import 'package:dozer_owner/features/owner_profile/domain/usecases/edit_owner_profile_usecase.dart';
// import 'package:dozer_owner/features/owner_profile/domain/usecases/get_owner_profile_usecase.dart';
// import 'package:dozer_owner/features/owner_profile/presentation/blocs/profile_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:http/http.dart' as http;

// final sl = GetIt.instance;

// Future<void> profileInit() async {
//   const String uri =
//       "https://a2sv-community-portal-api.onrender.com/api/Profile/me";
//   sl.registerLazySingleton(() => http.MultipartRequest('POST', Uri.parse(uri)));
//   //bloc
//   sl.registerFactory(() => ProfileBloc(editOwnerProfile: sl(), getOwner: sl()));

//   //usecases
//   sl.registerLazySingleton(() => GetOwner(repository: sl()));
//   sl.registerLazySingleton(() => EditOwnerProfile(repository: sl()));

//   //repositories
//   sl.registerLazySingleton<OwnerRepository>(
//     () => OwnerRepositoryImpl(
//       remoteDataSource: sl(),
//       localDataSource: sl(),
//       networkInfo: sl(),
//     ),
//   );

//   //datasources
//   sl.registerLazySingleton<OwnerRemoteDataSource>(() => OwmerRemoteDataSourceImpl(
//       client: sl(), sharedPreferences: sl(), request: sl()));
//   sl.registerLazySingleton<OwnerLocalDataSource>(
//       () => OwnerLocalDataSourceImpl(sharedPreferences: sl()));
// }