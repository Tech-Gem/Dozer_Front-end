import 'package:DozerOwner/core/errors/failures.dart';
import 'package:DozerOwner/core/usecases/usecase.dart';
import 'package:DozerOwner/features/owner_profile/domain/entities/user_entity.dart';
import 'package:DozerOwner/features/owner_profile/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class EditUserProfile implements UseCase<UserEntity, UserEntity> {
  final UserRepository repository;

  EditUserProfile({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await repository.editUserProfile(user);
  }
}