import 'package:DozerOwner/core/errors/failures.dart';
import 'package:DozerOwner/features/owner_profile/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, UserEntity>> editUserProfile(UserEntity user);
}
