
import 'package:DozerOwner/features/Equipment/presentation/pages/confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReviewDialog extends StatefulWidget {
  final String title;
  final String content;
  final Map<String, dynamic> formInfo;
  // final InfoFillingPage infoFillingPage;
  final void Function(Map<String, dynamic> formInfo) onConfirm;

  const ReviewDialog({
    required this.title,
    required this.content,
    required this.formInfo,
    // required this.infoFillingPage,
    required this.onConfirm,
  });

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  get http => null;

  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.content),
          SizedBox(height: 4.h),
          Text(
            'Please review your submission:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h),
          ...widget.formInfo.entries
              .map((entry) => Text('${entry.key}: ${entry.value}')),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            widget.onConfirm(widget.formInfo);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConfirmationPage()),
            );
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
