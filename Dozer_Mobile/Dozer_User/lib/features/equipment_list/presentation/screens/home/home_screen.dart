import 'package:Dozer/features/equipment_list/presentation/screens/home/widget/best_offer.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/home/widget/categories_widget.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/home/widget/custom_appbar.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/home/widget/custom_bottom_navigation_bar.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/home/widget/recommended_house.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/home/widget/search_input.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/home/widget/welcome_text.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeText(),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: SearchInput(),
              ),
              CategoriesWidget(),
              RecommendedHouse(),
             
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
