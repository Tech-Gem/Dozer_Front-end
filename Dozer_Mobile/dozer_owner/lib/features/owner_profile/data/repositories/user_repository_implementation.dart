import 'package:dartz/dartz.dart';
import 'package:dozer_owner/constants/constants.dart';
import 'package:dozer_owner/core/errors/exceptions.dart';
import 'package:dozer_owner/core/errors/failures.dart';
import 'package:dozer_owner/core/network/network_info.dart';
import 'package:dozer_owner/features/owner_profile/data/datasources/owner_local_datasource.dart';
import 'package:dozer_owner/features/owner_profile/data/datasources/owner_remote_datasource.dart';
import 'package:dozer_owner/features/owner_profile/domain/entities/user_entity.dart';
import 'package:dozer_owner/features/owner_profile/domain/repositories/user_repository.dart';


class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> editUserProfile(UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.editUserProfile(user);
        localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException {
        return const Left(ServerFailure(serverFaliure));
      }
    } else {
      return const Left(CacheFailure(cacheException));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getUser();
        localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException {
        return const Left(ServerFailure(serverFaliure));
      }
    } else {
      try {
        final localUser = await localDataSource.getUser();
        return Right(localUser);
      } on CacheException {
        return const Left(CacheFailure(cacheException));
      }
    }
  }
}
