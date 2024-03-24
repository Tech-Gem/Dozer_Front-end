import 'package:dartz/dartz.dart';
import 'package:dozer_owner/core/errors/failures.dart';
import 'package:dozer_owner/core/usecases/usecase.dart';
import 'package:dozer_owner/features/owner_profile/domain/entities/user_entity.dart';
import 'package:dozer_owner/features/owner_profile/domain/repositories/user_repository.dart';

class EditUserProfile implements UseCase<UserEntity, UserEntity> {
  final UserRepository repository;

  EditUserProfile({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await repository.editUserProfile(user);
  }
}