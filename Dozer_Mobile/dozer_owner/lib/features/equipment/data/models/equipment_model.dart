
import 'package:DozerOwner/features/equipment/domain/entities/equipment_entity.dart';

class EquipmentModel {
  final String name;
  final int quantity;
  final double price;
  final String location;
  final String description;
  final String category;
  final String capacity;
  final String model;
  final List<String> specifications;
  final bool transportation;
  final String image;
  final bool isBooked;

  EquipmentModel({
    required this.name,
    required this.quantity,
    required this.price,
    required this.location,
    required this.description,
    required this.category,
    required this.capacity,
    required this.model,
    required this.specifications,
    required this.transportation,
    required this.image,
    required this.isBooked,
  });

  factory EquipmentModel.fromEntity(Equipment equipment) {
    return EquipmentModel(
      name: equipment.name,
      quantity: equipment.quantity,
      price: equipment.price,
      location: equipment.location,
      description: equipment.description,
      category: equipment.category,
      capacity: equipment.capacity,
      model: equipment.model,
      specifications: equipment.specifications,
      transportation: equipment.transportation,
      image: equipment.image,
      isBooked: equipment.isBooked,
    );
  }

  Equipment toEntity() {
    return Equipment(
      name: name,
      quantity: quantity,
      price: price,
      location: location,
      description: description,
      category: category,
      capacity: capacity,
      model: model,
      specifications: specifications,
      transportation: transportation,
      image: image,
      isBooked: isBooked,
    );
  }
}