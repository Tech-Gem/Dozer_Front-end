import 'package:DozerOwner/core/routes/route_names.dart';
import 'package:DozerOwner/core/utils/colors.dart';
import 'package:DozerOwner/features/owner_profile/presentation/blocs/profile_bloc.dart';
import 'package:DozerOwner/features/owner_profile/presentation/blocs/profile_event.dart';
import 'package:DozerOwner/features/owner_profile/presentation/blocs/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const GetProfileEvent());
  }

  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is UploadingFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Failed To update your Profile Picture')),
          );
        }
        if (state is UpLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Updated your Profile Picture')),
          );
        }
        if (state is ProfileFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to laod your profile')),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              // if (state is ProfileLoadingState)
              //   const Expanded(
              //     child: Center(
              //       child: CircularProgressIndicator(),
              //     ),
              //   ),
              // if (state is ProfileLoadedState)
              Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange[800]!,
                            Colors.deepOrangeAccent
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 110.h,
                          ),
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 65.r,
                                  backgroundImage: const AssetImage(
                                      'assets/images/logo.jpg'),
                                  backgroundColor: Colors.white,
                                ),
                                Positioned(
                                  top: 97.h,
                                  right: 0,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // Handle the edit photo functionality
                                    },
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('Joe Doe',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.grey[200],
                      child: Center(
                        child: Card(
                          margin: EdgeInsets.fromLTRB(0.0, 45.h, 0.0, 0.0),
                          child: SizedBox(
                            width: 310.w,
                            height: 290.h,
                            child: Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Information",
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            if (state is ProfileLoadedState) {
                                              context
                                                  .go('/${AppRoutes.profile}');
                                            }
                                          },
                                          icon: Icon(Icons.edit)),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey[300],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Colors.blueAccent[400],
                                        size: 35,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Phone Number",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                          Text(
                                            "FairyTail, Magnolia",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey[400],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: Colors.yellowAccent[400],
                                        size: 35.h,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Email",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                          Text(
                                            "Spatial & Sword Magic, Telekinesis",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey[400],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.pinkAccent[400],
                                        size: 35.h,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Address",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                          Text(
                                            "Eating cakes",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey[400],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.construction,
                                        color: Colors.lightGreen[400],
                                        size: 35.h,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Equipments",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                          Text(
                                            "Team Natsu",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey[400],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (state is UpLoadingState)
                    const Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Uploading',
                              style: TextStyle(
                                  fontFamily: 'Urbanist', fontSize: 20),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            SpinKitThreeBounce(
                              size: 25,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  if (state is ProfileFailureState)
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<ProfileBloc>()
                              .add(const GetProfileEvent());
                        },
                        child: const Center(
                          child: Text(
                            'Reload',
                            style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 24,
                                color: primaryColor),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Positioned(
                top: 360.h,
                left: 20.w,
                right: 20.w,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: Column(
                          children: [
                            Text(
                              'Available',
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "$counter",
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                            )
                          ],
                        )),
                        Container(
                          child: Column(children: [
                            Text(
                              'pending',
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '3',
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                            )
                          ]),
                        ),
                        Container(
                            child: Column(
                          children: [
                            Text(
                              'rented',
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '2',
                              style: TextStyle(
                                fontSize: 15.sp,
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
