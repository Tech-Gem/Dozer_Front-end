import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              // Open the drawer
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
            ),
          ),
          SizedBox(width: 140),
          Stack(
            children: [
              
              IconButton(
                onPressed: () {
                  // Handle notification icon press
                },
               
                icon: SvgPicture.asset(
                  'assets/icons/notification.svg',
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    '1', // Replace with your notification count
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const CircleAvatar(backgroundImage: AssetImage('assets/images/profile.png'))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
