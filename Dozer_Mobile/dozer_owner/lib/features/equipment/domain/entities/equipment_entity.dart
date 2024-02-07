import 'package:equatable/equatable.dart';

class Equipment extends Equatable {
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

  Equipment({
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

  @override
  List<Object?> get props => [
        name,
        quantity,
        price,
        location,
        description,
        category,
        capacity,
        model,
        specifications,
        transportation,
        image,
        isBooked,
      ];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'location': location,
      'description': description,
      'category': category,
      'capacity': capacity,
      'model': model,
      'specifications': specifications,
      'transportation': transportation,
      'image': image,
      'isBooked': isBooked,
    };
  }
}