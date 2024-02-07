class ConstructionMachine {
  String name;
  String address;
  String description;
  String renterName;
  List<Map<String, String>> specifications;
  String maintenanceRequirements;
  double price;
  int availableAmount;
  String imageUrl;

  ConstructionMachine({
    required this.name,
    required this.address,
    required this.description,
    required this.renterName,
    required this.specifications,
    required this.maintenanceRequirements,
    required this.price,
    required this.imageUrl,
    required this.availableAmount
    
  });

  static List<ConstructionMachine> generateRecommended() {
    return List.generate(4, (index) => ConstructionMachine(
      name: 'Bulldozer 2000',
      address: 'Construction Site A',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      renterName: 'John Doe',
      specifications: [
        {'Capacity': '500 Tons'},
        {'Weight': '1000 kg'},
        // Add more specifications as needed
      ],
      maintenanceRequirements: 'Requires monthly checkup',
      price: 1000.0,
      imageUrl: 'assets/images/dozer.jpeg',
      availableAmount: 5
    ));
  }

  static List<ConstructionMachine> generateBestOffer() {
    return List.generate(5, (index) => ConstructionMachine(
      name: 'Bulldozer 2000',
      address: 'Construction Site A',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      renterName: 'Jane Doe',
      specifications: [
        {'Capacity': '500 Tons'},
        {'Weight': '1000 kg'},
        // Add more specifications as needed
      ],
      maintenanceRequirements: 'Requires monthly checkup',
      availableAmount: 5,
      price: 1000.0,
      imageUrl: 'assets/images/dozer.jpeg',
    ));
  }
}
