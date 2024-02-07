import 'package:dartz/dartz.dart';
import 'package:dozer_owner/core/errors/failures.dart';
import 'package:dozer_owner/features/equipment/domain/entities/equipment_entity.dart';
import 'package:equatable/equatable.dart';

abstract class EquipmentRepository extends Equatable {
  Future<Either<Failure, void>> createEquipment(Equipment equipment);
}