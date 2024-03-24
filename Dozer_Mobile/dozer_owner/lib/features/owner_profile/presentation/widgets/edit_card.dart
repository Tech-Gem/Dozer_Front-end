import 'package:dozer_owner/core/utils/colors.dart';
import 'package:dozer_owner/features/owner_profile/presentation/widgets/content_box.dart';
import 'package:dozer_owner/features/owner_profile/presentation/widgets/edit_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditCard extends StatelessWidget {
  const EditCard({
    super.key,
    required this.fieldList,
    required this.title,
    required this.boxHeight,
    this.bio = false,
    required this.controllers,
  });
  final List<List<dynamic>> fieldList;
  final String title;
  final double boxHeight;
  final Map<String, TextEditingController> controllers;
  final bool bio;

  @override
  Widget build(BuildContext context) {
    return ContentBox(
        boxHeight: boxHeight,
        child: Container(
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: primaryAccentColor,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              Column(
                children: fieldList
                    .map((fieldData) => EditField(
                          hintText: fieldData[0],
                          iconName: fieldData[1],
                          controllers: controllers,
                          validator: fieldData[2],
                        ))
                    .toList(),
              ),
              if (bio == true)
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, 16.h, 0, 0),
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: greyTextColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                          fontFamily: 'Urbanist', fontWeight: FontWeight.w400),
                      controller: controllers["Bio"],
                      maxLines: 3,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(
                            16.h),
                        hintText: "Bio",
                        hintStyle: const TextStyle(
                            color: greyTextColor2,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
