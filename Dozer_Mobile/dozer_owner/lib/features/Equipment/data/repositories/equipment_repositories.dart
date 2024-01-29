import 'package:DozerOwner/features/Equipment/data/datasources/equipment_remote_datasources.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import 'package:DozerOwner/core/errors/failures.dart';
import 'package:DozerOwner/features/Equipment/data/models/equipment_model.dart';
import 'package:DozerOwner/features/Equipment/domain/entities/equipment_entity.dart';
import 'package:DozerOwner/features/Equipment/domain/repositories/equipment_repository.dart';

class EquipmentRepositoryImpl extends Equatable implements EquipmentRepository {
  final EquipmentRemoteDataSource remoteDataSource;

  EquipmentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> createEquipment(Equipment equipment) async {
    try {
      final equipmentModel = EquipmentModel.fromEntity(equipment);
      await remoteDataSource.createEquipment(equipmentModel);
      return Right(null);
    } catch (e) {
      // Handle exceptions or errors
      return Left(ServerFailure('Failed to create equipment'));
    }
  }

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}
