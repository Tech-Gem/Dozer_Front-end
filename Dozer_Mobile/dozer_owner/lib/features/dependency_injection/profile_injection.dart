import 'package:DozerOwner/features/owner_profile/data/datasources/owner_local_datasource.dart';
import 'package:DozerOwner/features/owner_profile/data/datasources/owner_remote_datasource.dart';
import 'package:DozerOwner/features/owner_profile/data/repositories/user_repository_implementation.dart';
import 'package:DozerOwner/features/owner_profile/domain/repositories/user_repository.dart';
import 'package:DozerOwner/features/owner_profile/domain/usecases/edit_user_profile_usecase.dart';
import 'package:DozerOwner/features/owner_profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:DozerOwner/features/owner_profile/presentation/blocs/profile_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt sl = GetIt.instance;

Future<void> profileInj() async {
  //! Blocs
  sl.registerFactory(
    () => ProfileBloc(
      editUserProfile: sl(),
      getUser: sl(),
    ),
  );

  //! Use cases
  sl.registerLazySingleton(
    () => GetUser(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => EditUserProfile(
      repository: sl(),
    ),
  );

  //! Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //! Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
        client: sl(), sharedPreferences: sl(), request: sl()),
  );

  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  sl.registerLazySingleton<http.MultipartRequest>(
    () => http.MultipartRequest(
      'POST',
      Uri.parse('api_endpoint'),
    ),
  );
}
