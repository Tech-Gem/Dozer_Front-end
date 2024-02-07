import 'package:Dozer/features/equipment_list/domain/construction_machine_model.dart';
import 'package:Dozer/features/equipment_list/presentation/widget/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetailAppbar extends StatelessWidget {
  final ConstructionMachine constructionMachine;

  const DetailAppbar({Key? key, required this.constructionMachine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      child: Stack(
        children: [
          Image.asset(
            constructionMachine.imageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const CircleIconButton(
                    iconUrl: 'assets/icons/arrow.svg',
                    color: Colors.grey,
                  ),
                ),
                CircleIconButton(
                  iconUrl: 'assets/icons/mark.svg',
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
