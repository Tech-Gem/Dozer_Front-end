import 'package:DozerOwner/core/errors/failures.dart';
import 'package:DozerOwner/core/usecases/usecase.dart';
import 'package:DozerOwner/features/owner_profile/domain/entities/user_entity.dart';
import 'package:DozerOwner/features/owner_profile/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUser implements UseCase<UserEntity, NoParams> {
  final UserRepository repository;
  GetUser({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.getUser();
  }
}