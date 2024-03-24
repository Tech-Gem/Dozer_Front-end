import 'package:DozerOwner/core/errors/failures.dart';
import 'package:DozerOwner/features/equipment/domain/entities/equipment_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class EquipmentRepository extends Equatable {
  Future<Either<Failure, void>> createEquipment(Equipment equipment);
}