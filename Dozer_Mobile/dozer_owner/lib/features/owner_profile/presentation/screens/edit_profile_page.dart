import 'package:DozerOwner/core/utils/colors.dart';
import 'package:DozerOwner/core/validation/validation.dart';
import 'package:DozerOwner/features/owner_profile/domain/entities/user_entity.dart';
import 'package:DozerOwner/features/owner_profile/presentation/blocs/profile_bloc.dart';
import 'package:DozerOwner/features/owner_profile/presentation/blocs/profile_event.dart';
import 'package:DozerOwner/features/owner_profile/presentation/blocs/profile_state.dart';
import 'package:DozerOwner/features/owner_profile/presentation/widgets/edit_card.dart';
import 'package:DozerOwner/features/owner_profile/presentation/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserEntity user;
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final Map<String, TextEditingController> controllers;
  final _formkey = GlobalKey<FormState>();
  String fileName = "No file";
  String? cvPath;
  @override
  void initState() {
    super.initState();
    controllers = {
      'First Name': TextEditingController(text: widget.user.firstName),
      'Middle Name': TextEditingController(text: widget.user.middleName),
      'Last Name': TextEditingController(text: widget.user.lastName),
      'Phone Number': TextEditingController(text: widget.user.phoneNumber),
      'Email': TextEditingController(text: widget.user.email),
      'Address': TextEditingController(text: widget.user.address),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to save profile')),
              );
            } else if (state is ProfileSavedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile saved successfully')),
              );

              context.pop();
              context.read<ProfileBloc>().add(const GetProfileEvent());
            }
          },
          builder: (context, state) {
            return Form(
              key: _formkey,
              child: Stack(children: [
                Column(
                  children: [
                    Expanded(
                      child: TitleBar(
                        height: 100.h,
                        title: "Edit Profile",
                        iconName: "save_icon",
                        action: () {
                          if (_formkey.currentState!.validate()) {
                            final id = widget.user.id;
                            final firstName = controllers['Full Name']!.text;
                            final middleName = controllers['Middle Name']!.text;
                            final lastName = controllers['Last Name']!.text;
                            final phoneNumber = controllers['Phone Number']!.text;
                            final email = controllers['Email']!.text;
                            final address = controllers['Address']!.text;
                            final profilePicture = widget.user.profilePictureUrl;
                      
                            final user = UserEntity(
                              id: id,
                              firstName: firstName,
                              middleName: middleName,
                              lastName: lastName,
                              email: email,
                              phoneNumber: phoneNumber,
                              address: address,
                              profilePictureUrl: profilePicture,
                            );
                      
                            context
                                .read<ProfileBloc>()
                                .add(EditProfileEvent(user: user));
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          EditCard(
                            bio: true,
                            boxHeight: 521,
                            title: "Info",
                            fieldList: const [
                              [
                                'Full Name',
                                'profile_icon',
                                Validator.validateName
                              ],
                              [
                                'Phone Number',
                                'phone_icon',
                                Validator.validatePhoneNumber
                              ],
                              ['Email', 'email_icon', Validator.validateEmail],
                            ],
                            controllers: controllers,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (state is ProfileSavingState)
                  Container(
                    color: Colors.black54,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
              ]),
            );
          },
        ),
      ),
    );
  }
}
