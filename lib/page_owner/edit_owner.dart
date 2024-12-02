import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../util/custom_text.dart';
import '../util/add_car.dart';

class EditOwner extends StatefulWidget {
  const EditOwner({Key? key}) : super(key: key);

  @override
  State<EditOwner> createState() => _EditOwnerState();
}

class _EditOwnerState extends State<EditOwner> {
  void _showEditModal(BuildContext context, Car car, int index) {
    final makeController = TextEditingController(text: car.make);
    final modelController = TextEditingController(text: car.model);
    final registrationController = TextEditingController(text: car.registration);
    final milageController = TextEditingController(text: car.milage);
    final priceController = TextEditingController(text: car.price.toString());
    final locationController = TextEditingController(text: car.location);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Edit Car Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildInputField('Make', makeController),
              _buildInputField('Model', modelController),
              _buildInputField('Registration', registrationController),
              _buildInputField('Milage', milageController),
              _buildInputField('Price (€)', priceController),
              _buildInputField('Location', locationController),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Provider.of<CarProvider>(context, listen: false).deleteCar(index);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF2929),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      final updatedCar = car.copyWith(
                        make: makeController.text,
                        model: modelController.text,
                        registration: registrationController.text,
                        milage: milageController.text,
                        price: double.parse(priceController.text),
                        location: locationController.text,
                      );
                      Provider.of<CarProvider>(context, listen: false)
                          .updateCar(updatedCar, index);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2F89C0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Kanit',
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }

  Widget _buildInputField(String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cars = Provider.of<CarProvider>(context).cars;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 70),
        child: cars.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lottie/Animation_2.json', // Rruga e skedarit Lottie
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                "No cars available!",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                  fontFamily: 'Kanit',
                ),
              ),
            ],
          ),
        )
            : SingleChildScrollView(
          child: Column(
            children: cars.asMap().entries.map((entry) {
              final index = entry.key;
              final car = entry.value;
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: car.images.isNotEmpty
                                ? Image.file(
                              car.images.first,
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                                : Image.asset(
                              'assets/images/image_car_3.png',
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: '${car.make} ${car.model}',
                                isBold: true,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 5),
                              CustomText(
                                text: 'Registration: ${car.registration}',
                                fontSize: 18,
                                isBold: false,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: 'Milage: ${car.milage}',
                                fontSize: 18,
                                isBold: false,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: 'Price: ${car.price.toStringAsFixed(0)} €',
                                fontSize: 18,
                                isBold: false,
                                color: Colors.black,
                              ),
                              CustomText(
                                text: 'Location: ${car.location}',
                                fontSize: 18,
                                isBold: false,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/images/edit_icon.svg',
                          color: Colors.black,
                        ),
                        onPressed: () => _showEditModal(context, car, index),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

}