import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../util/add_car.dart';

class AddCarOwner extends StatefulWidget {
  const AddCarOwner({Key? key}) : super(key: key);

  @override
  State<AddCarOwner> createState() => _AddCarOwnerState();
}

class _AddCarOwnerState extends State<AddCarOwner> {
  final ImagePicker _picker = ImagePicker();
  List<File> carImages = [];
  final TextEditingController makeController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController registrationController = TextEditingController();
  final TextEditingController bodyTypeController = TextEditingController();
  final TextEditingController fuelTypeController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();
  final TextEditingController locationLineController = TextEditingController();
  final TextEditingController finalPriceController = TextEditingController();
  final TextEditingController powerController = TextEditingController();
  final TextEditingController milageController = TextEditingController();
  final TextEditingController consumerController = TextEditingController();
  final TextEditingController vehicleDescriptionController =
  TextEditingController();

  // Lista për equipment
  final List<String> equipmentOptions = [
    'Parking Sensors',
    '360° Camera',
    'Heated Seats',
    'Adaptive Cruise Control',
    'Apple CarPlay',
    'Satnav',
    'Premium Sound System'
  ];
  final List<String> selectedEquipment = [];

  // Lista për body colors
  final List<String> bodyColors = [
    'Black',
    'White',
    'Grey',
    'Red',
    'Blue',
    'Green',
  ];
  final List<String> selectedBodyColors = [];

  // Lista për interior colors
  final List<String> interiorColors = [
    'Black',
    'White',
    'Beige',
    'Brown',
    'Grey',
    'Carbon Fiber'
  ];
  final List<String> selectedInteriorColors = [];

  // Lista për upholstery
  final List<String> upholsteryOptions = [
    'Full Leather',
    'Part Leather',
    'Cloth',
    'Alcantara',
    'Velour',
    'Synthetic',
  ];
  final List<String> selectedUpholstery = [];

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        carImages.add(File(pickedFile.path));
      });
    }
  }

  void _saveCar() {
    if (makeController.text.isEmpty) {
      _showSnackBar('Please fill in the Make field.');
      return;
    }
    if (modelController.text.isEmpty) {
      _showSnackBar('Please fill in the Model field.');
      return;
    }
    if (registrationController.text.isEmpty) {
      _showSnackBar('Please fill in the First Registration field.');
      return;
    }
    if (bodyTypeController.text.isEmpty) {
      _showSnackBar('Please fill in the Body Type field.');
      return;
    }
    if (fuelTypeController.text.isEmpty) {
      _showSnackBar('Please fill in the Fuel Type field.');
      return;
    }
    if (transmissionController.text.isEmpty) {
      _showSnackBar('Please fill in the Transmission field.');
      return;
    }
    if (locationLineController.text.isEmpty) {
      _showSnackBar('Please fill in the Location field.');
      return;
    }
    if (finalPriceController.text.isEmpty) {
      _showSnackBar('Please fill in the Final Price field.');
      return;
    }
    if (double.tryParse(finalPriceController.text) == null) {
      _showSnackBar('Final Price must be a valid number.');
      return;
    }
    if (powerController.text.isEmpty) {
      _showSnackBar('Please fill in the Power field.');
      return;
    }
    if (int.tryParse(powerController.text) == null) {
      _showSnackBar('Power must be a valid integer.');
      return;
    }
    if (milageController.text.isEmpty) {
      _showSnackBar('Please fill in the Milage field.');
      return;
    }
    if (double.tryParse(milageController.text) == null) {
      _showSnackBar('Milage must be a valid number.');
      return;
    }
    if (consumerController.text.isEmpty) {
      _showSnackBar('Please fill in the Consumer field.');
      return;
    }
    if (double.tryParse(consumerController.text) == null) {
      _showSnackBar('Consumer must be a valid number.');
      return;
    }
    if (carImages.isEmpty) {
      _showSnackBar('Please add at least one image.');
      return;
    }

    final car = Car(
      make: makeController.text,
      model: modelController.text,
      milage: milageController.text,
      registration: registrationController.text,
      fuelType: fuelTypeController.text,
      transmission: transmissionController.text,
      location: locationLineController.text,
      price: double.parse(finalPriceController.text),
      power: int.parse(powerController.text),
      consumer: double.parse(consumerController.text),
      images: carImages,
      equipment: selectedEquipment,
      bodyColor:
      selectedBodyColors.isNotEmpty ? selectedBodyColors.first : '',
      interiorColor:
      selectedInteriorColors.isNotEmpty ? selectedInteriorColors.first : '',
      upholstery:
      selectedUpholstery.isNotEmpty ? selectedUpholstery.first : '',
      description: vehicleDescriptionController.text,
    );

    Provider.of<CarProvider>(context, listen: false).addCar(car);
    Navigator.pop(context);
  }


  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 16, fontFamily: 'Kanit'),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              _buildSearchAndFilter(),
              _buildStepHeader('Step 1 from 3'),
              _buildInputField('Make', makeController),
              _buildInputField('Model', modelController),
              _buildInputField('First registration', registrationController),
              _buildInputField('Body type', bodyTypeController),
              _buildInputField('Fuel type', fuelTypeController),
              _buildInputField('Transmission', transmissionController),
              _buildInputField('Location', locationLineController),
              _buildInputField('Milage', milageController),
              _buildInputField('Consumer', consumerController),
              const SizedBox(height: 20),
              _buildStepHeader('Step 2 from 3'),
              _buildImagePicker(),
              const SizedBox(height: 20),
              _buildRowInputFields(
                'Final price',
                finalPriceController,
                'Power',
                powerController,
              ),
              const SizedBox(height: 20),
              _buildStepHeader('Step 3 from 3'),

              const SizedBox(height: 20),
              _buildSelectionHeader('Select Equipment (Optional)'),
              _buildHorizontalScroll(equipmentOptions, selectedEquipment),

              const SizedBox(height: 20),
              _buildSelectionHeader('Select Body Colors (Optional)'),
              _buildHorizontalScroll(bodyColors, selectedBodyColors),

              const SizedBox(height: 20),
              _buildSelectionHeader('Select Interior Colors (Optional)'),
              _buildHorizontalScroll(interiorColors, selectedInteriorColors),

              const SizedBox(height: 20),
              _buildSelectionHeader('Select Upholstery (Optional)'),
              _buildHorizontalScroll(upholsteryOptions, selectedUpholstery),

              const SizedBox(height: 20),
              _buildSelectionHeader('Vehicle Description (Optional)'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFD9D9D9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: vehicleDescriptionController,
                      maxLines: 4,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Kanit',
                        color: Color(0xFF828282),
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter vehicle description...',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Kanit',
                          color: Color(0xFF828282),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: _saveCar,
                      child: Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF2F89C0),
                        ),
                        child: const Center(
                          child: Text(
                            'Finish',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: 'Kanit',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalScroll(List<String> options, List<String> selected) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: options.map((option) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (selected.contains(option)) {
                    selected.remove(option);
                  } else {
                    selected.add(option);
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selected.contains(option)
                      ? const Color(0xFF2F89C0)
                      : const Color(0xFFD9D9D9),
                ),
                child: Center(
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Kanit',
                      color: selected.contains(option)
                          ? Colors.white
                          : const Color(0xFF828282),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInputField(String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextField(
            controller: controller,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Kanit',
              fontSize: 17,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xFF828282),
                fontFamily: 'Kanit',
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFD9D9D9),
          ),
          child: carImages.isEmpty
              ? const Center(
            child: Text(
              "Click to add images",
              style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 16,
                color: Color(0xFF828282),
              ),
            ),
          )
              : GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: carImages.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  carImages[index],
                  width: 80,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRowInputFields(
      String hint1,
      TextEditingController? controller1,
      String hint2,
      TextEditingController? controller2,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSmallInputField(hint1, controller1),
          _buildSmallInputField(hint2, controller2),
        ],
      ),
    );
  }

  Widget _buildSmallInputField(
      String hintText,
      TextEditingController? controller,
      ) {
    return Container(
      width: 180,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFD9D9D9),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
          controller: controller,
          style: const TextStyle(
            color: Color(0xFF828282),
            fontFamily: 'Kanit',
            fontSize: 17,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF828282),
              fontFamily: 'Kanit',
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Arrow Back Button
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Veprimi për kthim prapa
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                    'assets/images/arrow_back.svg'), // Ikona për kthim prapa
              ),
            ),
          ),
        ],
      ),
    );
  }
}
