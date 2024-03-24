import 'package:dozer_owner/features/owner_profile/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String firstName,
    required String middleName,
    required String lastName,
    required String address,
    required String phoneNumber,
    required String email,
    required String profilePictureUrl,
  }) : super(
          id: id,
          firstName: firstName,
          middleName: middleName,
          lastName: lastName,
          address: address,
          phoneNumber: phoneNumber,
          email: email,
          profilePictureUrl: profilePictureUrl,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'address': address,
      'phoneNumber': phoneNumber,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'address': address,
      'phoneNumber': phoneNumber,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
