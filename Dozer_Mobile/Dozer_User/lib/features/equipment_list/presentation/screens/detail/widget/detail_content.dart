import 'package:Dozer/core/app_pages.dart';
import 'package:Dozer/features/equipment_list/domain/construction_machine_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailContent extends StatelessWidget {
  final ConstructionMachine constructionMachine;

  const DetailContent({Key? key, required this.constructionMachine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Content')),
      body: Container(
        height: MediaQuery.of(context).size.height/3, // Set a specific height or use other constraints
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  constructionMachine.name,
                  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  constructionMachine.address,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 10),
                Text(
                  'Description:',
                  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  constructionMachine.description,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 10),
                Text(
                  'Renter\'s Name:',
                  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  constructionMachine.renterName,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 10),
                Text(
                  'Specifications:',
                  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                for (var spec in constructionMachine.specifications)
                  ...[
                    Text(
                      '${spec.keys.first}: ${spec.values.first}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 5),
                  ],
                const SizedBox(height: 10),
                Text(
                  'Maintenance Requirements:',
                  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  constructionMachine.maintenanceRequirements,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 20),
                Text(
                  'Price:',
                  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${constructionMachine.price} ',
                        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Per hour',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Available Amount:',
                  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  constructionMachine.availableAmount.toString(),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 20),
                // "Book Now" button at the bottom
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Implement booking functionality
                      Get.toNamed(AppPages.BOOKINGFORM);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Book Now",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  constructionMachine.description,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
