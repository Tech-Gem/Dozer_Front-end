import 'package:Dozer/features/equipment_list/presentation/screens/bid_screen.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/book/booking_form.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/book/booking_info.dart';
import 'package:Dozer/features/equipment_list/presentation/screens/home/home_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = '/';
  static const BID = '/bid';
  static const ALL_MACHINES = '/all_machines';
  static const BOOKINGS = '/bookings';
  static const BOOKINGFORM = '/booking_form';
  static const BOOKINGINFO = '/booking_info';

  static final routes = [
    GetPage(
      name: INITIAL,
      page: () => HomeScreen(),
      
    ),
    GetPage(
      name: BID,
      page: () => BidScreen(),
    ),
    GetPage(
      name: ALL_MACHINES,
      page: () => AllMachinesScreen(),
    ),
    GetPage(
      name: BOOKINGS,
      page: () => BookingsScreen(),
    ),
     GetPage(
      name: BOOKINGFORM,
      page: () => BookingFormPage(),
    ),
    GetPage(
      name: BOOKINGINFO,
      page: () => BookingInfoPage(),
    ),
  ];
}
