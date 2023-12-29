import 'package:Dozer/core/app_pages.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/home/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingFormPage extends StatefulWidget {
  @override
  _BookingFormPageState createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  final TextEditingController _availableAmountController = TextEditingController();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 1));
  TimeOfDay _startTime = TimeOfDay.now();

  int _availableAmount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Container(
          color: Colors.grey[200],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Text(
                  'Booking Form',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                _buildAmountField('Available Amount', _availableAmount),
                _buildDateField('Starting Date', _startDate, (date) {
                  setState(() {
                    _startDate = date;
                  });
                }),
                _buildDateField('End Date', _endDate, (date) {
                  setState(() {
                    _endDate = date;
                  });
                }),
                _buildTimeField('Expected Starting Time', _startTime, (time) {
                  setState(() {
                    _startTime = time;
                  });
                }),
                const SizedBox(
                  height: 20,
                ),
                Container(
  margin: const EdgeInsets.all(16),
  height: 45,
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.transparent, // Set the container background color to transparent
    boxShadow: [
      BoxShadow(
        color: Colors.grey, // Shadow color
        spreadRadius: 2, // Spread radius
        blurRadius: 4, // Blur radius
        offset: Offset(0, 2), // Offset to give a lift effect
      ),
    ],
    borderRadius: BorderRadius.circular(36),
  ),
  child: ElevatedButton(
    onPressed: () {
      Get.toNamed(AppPages.BOOKINGINFO);
    },
    style: ElevatedButton.styleFrom(
      primary: const Color.fromARGB(255, 253, 188, 51), // Yellow background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36),
      ),
    ),
    child: Container(
      alignment: Alignment.center,
      child: const Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
)

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAmountField(String label, int amount) {
    return Container(
      width: double.infinity,
      height: 60, // Adjusted height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(color: Colors.grey[600]),
        ),
        subtitle: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_downward),
              onPressed: () {
                setState(() {
                  _availableAmount = _availableAmount > 0 ? _availableAmount - 1 : 0;
                  _availableAmountController.text = _availableAmount.toString();
                });
              },
            ),
            Expanded(
              child: TextField(
                controller: _availableAmountController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  setState(() {
                    _availableAmount = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_upward),
              onPressed: () {
                setState(() {
                  _availableAmount = _availableAmount + 1;
                  _availableAmountController.text = _availableAmount.toString();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField(String label, DateTime selectedDate, Function(DateTime) onDateChanged) {
    String formattedDate = DateFormat.yMd().format(selectedDate);

    return Container(
      width: double.infinity,
      height: 60, // Adjusted height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(color: Colors.grey[600]),
        ),
        subtitle: Text(
          formattedDate,
          style: TextStyle(fontSize: 18),
        ),
        onTap: () {
          _showDatePicker(selectedDate, onDateChanged);
        },
      ),
    );
  }

  Widget _buildTimeField(String label, TimeOfDay selectedTime, Function(TimeOfDay) onTimeChanged) {
    String formattedTime = selectedTime.format(context);

    return Container(
      width: double.infinity,
      height: 60, // Adjusted height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(color: Colors.grey[600]),
        ),
        subtitle: Text(
          formattedTime,
          style: TextStyle(fontSize: 18),
        ),
        onTap: () {
          _showTimePicker(selectedTime, onTimeChanged);
        },
      ),
    );
  }

  Future<void> _showDatePicker(DateTime initialDate, Function(DateTime) onDateChanged) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      onDateChanged(pickedDate);
    }
  }

  Future<void> _showTimePicker(TimeOfDay initialTime, Function(TimeOfDay) onTimeChanged) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      onTimeChanged(pickedTime);
    }
  }
}
