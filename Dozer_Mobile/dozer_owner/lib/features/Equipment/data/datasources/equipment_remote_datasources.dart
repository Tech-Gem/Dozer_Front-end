import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:DozerOwner/features/Equipment/data/models/equipment_model.dart';

class EquipmentRemoteDataSource {
  static const apiUrl =
      'https://dozer-backend-tech-gem.onrender.com/api/v1/equipments';

  Future<void> createEquipment(EquipmentModel equipmentModel) async {
    final url = Uri.parse(apiUrl);

    final body = jsonEncode(equipmentModel.toEntity().toJson());
    print("RRRRRRRRRRRRRRRRRrr${body}");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImYwNTU3MTlkLTlhYTUtNDE4Mi05NjVjLTM1MjM1M2M4OWU1YiIsImlhdCI6MTcwNjUyMzQzNSwiZXhwIjoxNzE0Mjk5NDM1fQ.WPR4lRz9Ra5uEvCutm8WaMuNf2R09Y454rPsTqSK8_s'
      },
      body: body,
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // Equipment created successfully
      print('Equipment created successfully!');
      return;
    } else {
      // Handle API error or failure
      throw Exception('Failed to create equipment');
    }
  }
}
