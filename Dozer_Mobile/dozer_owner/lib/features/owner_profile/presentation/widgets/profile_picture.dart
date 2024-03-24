import 'dart:math';
import 'package:dozer_owner/core/utils/colors.dart';
import 'package:dozer_owner/features/owner_profile/domain/entities/user_entity.dart';
import 'package:dozer_owner/features/owner_profile/presentation/blocs/profile_bloc.dart';
import 'package:dozer_owner/features/owner_profile/presentation/blocs/profile_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture(
      {super.key, required this.profilePicture, required this.user});
  final String profilePicture;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final pictureSize = min(
      100.h,
      100.w,
    );
    final editIconSize = min(
      30.h,
      30.w,
    );
    ImageProvider imageProvider;
    if (profilePicture == "No") {
      imageProvider = const AssetImage('assets/images/no_profile.jpg');
    } else {
      imageProvider = NetworkImage(profilePicture);
    }
    ImagePicker picker = ImagePicker();
    XFile? image;
    return SizedBox(
      width: pictureSize,
      height: pictureSize,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                final Uri uri = Uri.parse(profilePicture);
                launchUrl(uri);
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fitWidth,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () async {
                image = await picker.pickImage(source: ImageSource.gallery);

                final newUser = UserEntity(
                    id: user.id,
                    firstName: user.firstName,
                    middleName: user.middleName,
                    lastName: user.lastName,
                    address: user.address,
                    phoneNumber: user.phoneNumber,
                    email: user.email,
                    profilePictureUrl: user.profilePictureUrl);
                context
                    .read<ProfileBloc>()
                    .add(EditProfilePictureEvent(user: newUser));
              },
              child: Container(
                width: editIconSize,
                height: editIconSize,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/edit_icon_2.svg',
                    width: editIconSize * 0.6,
                    height: editIconSize * 0.6,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
