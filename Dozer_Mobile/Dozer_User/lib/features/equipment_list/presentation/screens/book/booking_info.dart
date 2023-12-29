import 'package:Dozer/features/equipment_list/presentation/screens/home/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
class BookingInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:CustomAppBar(),
        body: BookingInfo(),
      ),
    );
  }
}

class BookingInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Equipment Picture
          Container(
            margin: EdgeInsets.symmetric(horizontal:10.0),
            width: 350.0,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: AssetImage('assets/images/dozer.jpeg'), // Use your image asset path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Equipment Details Card
          SizedBox(height: 20),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.symmetric(horizontal:10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Container(
              width: 350,
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Equipment Name: Dozer',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          'Amount: \$100/hour',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          'Start Date: 2023-01-01',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          'End Date: 2023-01-10',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          'Expected Starting Time: 10:00 AM',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Confirm Booking Button
          SizedBox(height: 10,),
          ElevatedButton(
            
            onPressed: () {
              // Implement your booking confirmation logic here
              print('Booking Confirmed!');
            },
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
               // Use primary color
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                'Confirm Booking',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}