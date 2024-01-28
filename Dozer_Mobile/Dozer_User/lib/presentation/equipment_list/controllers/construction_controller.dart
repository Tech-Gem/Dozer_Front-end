import 'package:Dozer/presentation/equipment_list/models/construction_machine.dart';
import 'package:Dozer/presentation/equipment_list/repository/construction_repository.dart';
import 'package:get/get.dart';


class ConstructionMachineController extends GetxController {
  final ConstructionMachineRepository _repository = ConstructionMachineRepository();
  RxList<ConstructionMachineModel> recommendedList = <ConstructionMachineModel>[].obs;
  Rx<Status> status = Status.loading.obs; // Add status

  @override
  void onInit() {
    super.onInit();
    loadRecommendedMachines();
  }

  void loadRecommendedMachines() async {
  try {
    status(Status.loading); // Set loading status
    final machines = await _repository.getRecommendedMachines();

    if (machines.isNotEmpty) {
      recommendedList.assignAll(machines);
      status(Status.success); // Set success status
    } else {
      status(Status.error); // Set error status
      print('Error loading recommended machines: Empty response');
    }
  } catch (e) {
    status(Status.error); // Set error status
    print('Error loading recommended machines: $e');
  }
}

}

enum Status { loading, success, error }
