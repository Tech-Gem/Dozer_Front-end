import 'package:Dozer/features/equipment_list/domain/construction_machine_model.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/detail/widget/detail_appbar.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/detail/widget/detail_content.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatelessWidget {
  final ConstructionMachine machine;

  const DetailScreen({Key? key, required this.machine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailAppbar(constructionMachine: machine,),
              const SizedBox(height: 20),
              DetailContent(constructionMachine: machine,),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
