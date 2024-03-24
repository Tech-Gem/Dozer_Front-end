import 'package:DozerOwner/core/errors/failures.dart';
import 'package:DozerOwner/core/usecases/usecase.dart';
import 'package:DozerOwner/features/equipment/domain/entities/equipment_entity.dart';
import 'package:DozerOwner/features/equipment/domain/repositories/equipment_repository.dart';
import 'package:dartz/dartz.dart';

class CreateEquipmentUseCase extends UseCase<void, Equipment> {
  final EquipmentRepository equipmentRepository;

  CreateEquipmentUseCase({required this.equipmentRepository});

  @override
  Future<Either<Failure, void>> call(Equipment equipment) async {
    final validation = _validateEquipment(equipment);
    if (validation.isLeft()) {
      return Left(
          validation.fold((failure) => failure, (_) => ValidationFailure()));
    }

    return await equipmentRepository.createEquipment(equipment);
  }

  Either<Failure, void> _validateEquipment(Equipment equipment) {
    if (equipment.name.isEmpty) {
      return Left(ValidationFailure('Equipment name cannot be empty'));
    }

    if (equipment.quantity <= 0) {
      return Left(
          ValidationFailure('Equipment quantity must be greater than zero'));
    }

    if (equipment.price <= 0) {
      return Left(
          ValidationFailure('Equipment price must be greater than zero'));
    }

    if (equipment.location.isEmpty) {
      return Left(ValidationFailure('Equipment location cannot be empty'));
    }

    if (equipment.description.isEmpty) {
      return Left(ValidationFailure('Equipment description cannot be empty'));
    }

    if (equipment.category.isEmpty) {
      return Left(ValidationFailure('Equipment category cannot be empty'));
    }

    if (equipment.capacity.isEmpty) {
      return Left(ValidationFailure('Equipment capacity cannot be empty'));
    }

    if (equipment.model.isEmpty) {
      return Left(ValidationFailure('Equipment model cannot be empty'));
    }

    if (equipment.specifications.isEmpty) {
      return Left(
          ValidationFailure('Equipment specifications cannot be empty'));
    }

    // if (equipment.transportation.isEmpty) {
    //   return Left(
    //       ValidationFailure('Equipment transportation cannot be empty'));
    // }

    return Right(null);
  }
}