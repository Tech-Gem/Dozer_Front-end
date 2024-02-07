import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const SizedBox(height: 10),
          Text(
            'What do you need?',
            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
