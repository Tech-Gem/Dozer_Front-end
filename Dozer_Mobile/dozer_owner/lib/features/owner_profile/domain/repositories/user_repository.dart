import 'package:dartz/dartz.dart';
import 'package:dozer_owner/core/errors/failures.dart';
import 'package:dozer_owner/features/owner_profile/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, UserEntity>> editUserProfile(UserEntity user);
}
