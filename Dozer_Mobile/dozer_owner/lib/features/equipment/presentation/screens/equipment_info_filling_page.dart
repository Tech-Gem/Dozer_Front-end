import 'dart:convert';
import 'package:DozerOwner/core/routes/route_names.dart';
import 'package:DozerOwner/core/utils/colors.dart';
import 'package:DozerOwner/core/validation/validation.dart';
import 'package:DozerOwner/features/authentication/presentation/widget/text_field.dart';
import 'package:DozerOwner/features/equipment/data/datasources/equipment_remote_datasource.dart';
import 'package:DozerOwner/features/equipment/data/models/equipment_model.dart';
import 'package:DozerOwner/features/equipment/presentation/screens/review_equipment_page.dart';
import 'package:DozerOwner/features/equipment/presentation/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class InfoFillingPage extends StatefulWidget {
  const InfoFillingPage({super.key});

  @override
  _InfoFillingPageState createState() => _InfoFillingPageState();
}

class _InfoFillingPageState extends State<InfoFillingPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isValid = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController specificationsController = TextEditingController();
  TextEditingController transportationController = TextEditingController();

  List<String> booleanDropdownValues = ["true", "false"];

  File? imageFile;
  String? _imageUrl;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) imageFile = File(pickedFile.path);
    });
  }

  Future<void> _uploadImage() async {
    print('wwwwwwwwweeeeeeeeeeeeeeeeeeeeee');
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dvzsaa0eo/upload');

    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'pfnwlmxn'
      ..fields['folder'] = 'Equipment'
      ..files.add(await http.MultipartFile.fromPath('file', imageFile!.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      setState(() {
        final url = jsonMap['url'];
        _imageUrl = url;
      });
      print(_imageUrl);
      print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
    }
  }

  void validateInputs() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isValid = true;
      });
    } else {
      setState(() {
        _isValid = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill in all the required fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title:
                const Text('Form Page', style: TextStyle(color: Colors.white)),
            backgroundColor: primaryColor,
            actions: [
              GestureDetector(
                onTap: () {
                  context.go('/${AppRoutes.profile}');
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ProfilePage(),
                  //   ),
                  // );
                },
                child: const CircleAvatar(
                  // Display user profile image
                  backgroundImage:
                      NetworkImage('https://picsum.photos/250?image=9'),
                  radius: 15,
                ),
              ),
              const SizedBox(
                  width:
                      10), // Add some spacing between the image and the title
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(2.w, 3.h, 4.w, 3.h),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Submit your proposal for your equipment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:
                            24.sp, // Responsive font size based on screen width
                        fontWeight: FontWeight.bold,
                        color: greyTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 55.w),
                      child: Text(
                        'Equipment Name',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: nameController,
                      hintText: 'Name',
                      icon: Icons.person,
                      validator: (value) {
                        setState(() {
                          _isValid = value != null && value.isNotEmpty;
                        });
                        return Validator.validateName(value);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 68.w),
                      child: Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: quantityController,
                      hintText: 'Quantity',
                      icon: Icons.format_list_numbered,
                      validator: Validator.validateQuantity,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 60.w),
                      child: Text(
                        'Price per hour',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: priceController,
                      hintText: 'Price per hour',
                      icon: Icons.attach_money,
                      validator: Validator.validatePrice,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 68.w),
                      child: Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: locationController,
                      hintText: 'Location',
                      icon: Icons.location_on,
                      validator: Validator.validateLocation,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 67.w),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: descriptionController,
                      hintText: 'Description',
                      icon: Icons.description,
                      validator: Validator.validateDescription,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 68.w),
                      child: Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextFieldDropDown<String>(
                      controller: categoryController,
                      hintText: 'Category',
                      icon: Icons.category,
                      validator: Validator.validateCategory,
                      dropdownValues: const {
                        'CompactEquipment': 'CompactEquipment',
                        'HeavyEarthmoving': 'HeavyEarthmoving',
                        'LiftAerialWorkPlatform': 'LiftAerialWorkPlatform',
                        'RollersCompaction': 'RollersCompaction',
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.w),
                        color: textFieldColor,
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2.w,
                        ),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                      child: TextFormField(
                        onTap: _pickImage,
                        readOnly: true,
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: 'Image',
                          icon: const Icon(Icons.image),
                          suffixIcon: imageFile != null
                              ? Image.file(
                                  imageFile!,
                                  width: 15.w,
                                  height: 15.h,
                                )
                              : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 68.w),
                      child: Text(
                        'Capacity',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: capacityController,
                      hintText: 'Capacity',
                      icon: Icons.people,
                      validator: Validator.validateCapacity,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 74.w),
                      child: Text(
                        'Model',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: modelController,
                      hintText: 'Model',
                      icon: Icons.model_training,
                      validator: Validator.validateModel,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 65.w),
                      child: Text(
                        'Specifications',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: specificationsController,
                      hintText: 'Specifications',
                      icon: Icons.settings,
                      validator: Validator.validateSpecifications,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 65.w),
                      child: Text(
                        'Transportation',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: transportationController,
                      hintText: 'Transportation',
                      icon: Icons.directions_car,
                      validator: Validator.validateTransportation,
                    ),
                    SizedBox(height: 34.h),
                    ElevatedButton(
                      onPressed: () {
                        validateInputs();
                        if (_isValid) {
                          // Access the form values using the text controllers
                          String name = nameController.text;
                          String quantity = quantityController.text;
                          String price = priceController.text;
                          String location = locationController.text;
                          String description = descriptionController.text;
                          String category = categoryController.text;
                          String capacity = capacityController.text;
                          String model = modelController.text;
                          List<String> specifications = [
                            specificationsController.text
                          ];
                          String transportation = transportationController.text;
                          File image = imageFile!;
                          // Create the formInfo map
                          Map<String, dynamic> formInfo = {
                            'Name': name,
                            'Quantity': quantity,
                            'Price': price,
                            'Location': location,
                            'Description': description,
                            'Category': category,
                            'Capacity': capacity,
                            'Model': model,
                            'Specifications': specifications,
                            'Transportation': transportation,
                            'Image': image.toString(),
                          };

                          // Show the review dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ReviewDialog(
                                title: 'Review',
                                content: 'Please review your submission.',
                                formInfo: formInfo,
                                onConfirm: (formInfo) {
                                  _createEquipment(formInfo);
                                },
                              );
                            },
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void _createEquipment(Map<String, dynamic> formInfo) async {
    _uploadImage();
    print(_imageUrl);
    print('againnn');
    try {
      final equipmentModel = EquipmentModel(
        name: formInfo['Name'] ?? '',
        quantity: int.parse(formInfo['Quantity'] ?? '0'),
        price: double.parse(formInfo['Price'] ?? '0'),
        location: formInfo['Location'] ?? '',
        description: formInfo['Description'] ?? '',
        category: formInfo['Category'] ?? '',
        capacity: formInfo['Capacity'] ?? '',
        model: formInfo['Model'] ?? '',
        specifications: formInfo['Specifications'] ?? '',
        transportation: true,
        image: _imageUrl ?? '',
        isBooked: false,
      );

      print('*****************************************12345');
      final remoteDataSource = EquipmentRemoteDataSource();
      await remoteDataSource.createEquipment(equipmentModel);

      // Success! The equipment was created on the backend
      print('Equipment created successfully!');
      debugPrint('Equipment created successfully!');
      // debugPrint('Error creating equipment: $e');

      context.go('/${AppRoutes.confirm}');
    } catch (e) {
      // Handle error connecting to the backend or creating the equipment
      print('Error creating equipment: $e');

      // You can show an error message to the user or handle the error in another way
    }
  }
}
