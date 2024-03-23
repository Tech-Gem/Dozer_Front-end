import 'package:dozer_owner/features/owner_profile/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String address;
  final String phoneNumber;
  final String email;
  final String profilePictureUrl;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.profilePictureUrl,
  });

  UserModel toUserModel() {
    return UserModel(
        id: id,
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        address: address,
        phoneNumber: phoneNumber,
        email: email,
        profilePictureUrl: profilePictureUrl);
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        middleName,
        lastName,
        address,
        phoneNumber,
        email,
        profilePictureUrl,
      ];
}
