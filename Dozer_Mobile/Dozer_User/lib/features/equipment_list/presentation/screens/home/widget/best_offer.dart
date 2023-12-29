import 'package:Dozer/features/equipment_list/domain/construction_machine_model.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/home/widget/best_offer_item_widget.dart';
import 'package:flutter/material.dart';

class BestOffer extends StatelessWidget {
  final List<ConstructionMachine> listOffer = ConstructionMachine.generateBestOffer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Offer',
                style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'See All',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          ...listOffer.map(
            (machineData) => BestOfferItemWidget(machine: machineData),
          ),
        ],
      ),
    );
  }
}