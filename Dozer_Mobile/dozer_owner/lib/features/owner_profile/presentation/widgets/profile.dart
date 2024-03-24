import 'package:dozer_owner/core/utils/colors.dart';
import 'package:dozer_owner/features/owner_profile/domain/entities/user_entity.dart';
import 'package:dozer_owner/features/owner_profile/presentation/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.user,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.address,
  });
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String profilePicture;
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    final TextStyle biotextStyle = TextStyle(
        height: 1,
        fontFamily: 'Urbanist',
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: primaryColor);
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          SizedBox(
            height: 127.h,
            child: Row(
              children: [
                ProfilePicture(
                  profilePicture: profilePicture,
                  user: user,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: primaryColor),
                    ),
                    Text(email, style: biotextStyle),
                    Text(phoneNumber, style: biotextStyle),
                    Text(address, style: biotextStyle),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 80.h,
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}