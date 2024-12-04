import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../util/add_car.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  final List<String> selectedEquipment = [];
  final List<String> selectedBodyColors = [];
  final List<String> selectedInteriorColors = [];
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
      _showSnackBar(AppLocalizations.of(context)!.pleaseFillMake);
      return;
    }
    if (modelController.text.isEmpty) {
      _showSnackBar(AppLocalizations.of(context)!.pleaseFillModel);
      return;
    }
    if (registrationController.text.isEmpty) {
      _showSnackBar(AppLocalizations.of(context)!.pleaseFillRegistration);
      return;
    }
    if (bodyTypeController.text.isEmpty) {
      _showSnackBar(AppLocalizations.of(context)!.pleaseFillBodyType);
      return;
    }
    if (fuelTypeController.text.isEmpty) {
      _showSnackBar(AppLocalizations.of(context)!.pleaseFillFuelType);
      return;
    }
    if (transmissionController.text.isEmpty) {
      _showSnackBar(AppLocalizations.of(context)!.pleaseFillTransmission);
      return;
    }
    if (locationLineController.text.isEmpty) {
      _showSnackBar(AppLocalizations.of(context)!.pleaseFillLocation);
      return;
    }
    if (finalPriceController.text.isEmpty) {
      _showSnackBar(AppLocalizations.of(context)!.pleaseFillPrice);
      return;
    }
    if (double.tryParse(finalPriceController.text) == null) {
      _showSnackBar(AppLocalizations.of(context)!.pleaseFillValidNumber);
      return;
    }
    if (powerController.text.isEmpty) {
      _showSnackBar(AppLocalizations.of(context)!.pleaseFillPower);
      return;
    }
    if (int.tryParse(powerController.text) == null) {
      _showSnackBar(AppLocalizations.of(context)!.powerMustBeInt);
      return;
    }
    if (milageController.text.isEmpty) {
      _showSnackBar(AppLocalizations.of(context)!.pleaseFillMileage);
      return;
    }
    if (double.tryParse(milageController.text) == null) {
      _showSnackBar(AppLocalizations.of(context)!.mileageMustBeNumber);
      return;
    }
    if (consumerController.text.isEmpty) {
      _showSnackBar(AppLocalizations.of(context)!.consumerMustBeNumber);
      return;
    }
    if (double.tryParse(consumerController.text) == null) {
      _showSnackBar(AppLocalizations.of(context)!.consumerMustBeNumber);
      return;
    }
    if (carImages.isEmpty) {
      _showSnackBar(AppLocalizations.of(context)!.pleaseAddImage);
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
      bodyColor: selectedBodyColors.isNotEmpty ? selectedBodyColors.first : '',
      interiorColor:
          selectedInteriorColors.isNotEmpty ? selectedInteriorColors.first : '',
      upholstery: selectedUpholstery.isNotEmpty ? selectedUpholstery.first : '',
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
    //Lista per material
    final List<String> upholsteryOptions = [
      AppLocalizations.of(context)!.fullLeather,
      AppLocalizations.of(context)!.partLeather,
      AppLocalizations.of(context)!.cloth,
      AppLocalizations.of(context)!.alcantara,
      AppLocalizations.of(context)!.velour,
    ];
    //Lista per ngjyren e vetrues
    final List<String> bodyColors = [
      AppLocalizations.of(context)!.black,
      AppLocalizations.of(context)!.white,
      AppLocalizations.of(context)!.grey,
      AppLocalizations.of(context)!.red,
      AppLocalizations.of(context)!.blue,
      AppLocalizations.of(context)!.green,
    ];
    // Lista per equipment
    final List<String> equipmentOptions = [
      AppLocalizations.of(context)!.parkingSensors,
      AppLocalizations.of(context)!.satnav,
      AppLocalizations.of(context)!.appleCarPlay,
      AppLocalizations.of(context)!.androidAuto,
      AppLocalizations.of(context)!.abs,
      AppLocalizations.of(context)!.rearViewCamera,
      AppLocalizations.of(context)!.blindSpotMonitoring,
      AppLocalizations.of(context)!.tirePressure,
      AppLocalizations.of(context)!.climate,
      AppLocalizations.of(context)!.heatedSeats,
      AppLocalizations.of(context)!.coolSeats,
      AppLocalizations.of(context)!.electricAdjustableSeats,
      AppLocalizations.of(context)!.sunroof,
      AppLocalizations.of(context)!.cruiseControl,
      AppLocalizations.of(context)!.touchScreenDisplay,
      AppLocalizations.of(context)!.usbPorts,
      AppLocalizations.of(context)!.wirelessCharger,
      AppLocalizations.of(context)!.fourWd,
      AppLocalizations.of(context)!.turboChargedEngine,
      AppLocalizations.of(context)!.startStopSystem,
      AppLocalizations.of(context)!.ledHeadLights,
      AppLocalizations.of(context)!.roofRails,
      AppLocalizations.of(context)!.fogLights,
      AppLocalizations.of(context)!.electricFoldingMirroring,
      AppLocalizations.of(context)!.whichBodyColor,
    ];
    //Lista per interior color
    final List<String> interiorColors = [
      AppLocalizations.of(context)!.black,
      AppLocalizations.of(context)!.white,
      AppLocalizations.of(context)!.brown,
      AppLocalizations.of(context)!.red,
      AppLocalizations.of(context)!.darkGreen,
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              _buildSearchAndFilter(),
              _buildStepHeader(AppLocalizations.of(context)!.stepOneFromThree),
              _buildInputField(AppLocalizations.of(context)!.make, makeController),
              _buildInputField(AppLocalizations.of(context)!.model, modelController),
              _buildInputField(AppLocalizations.of(context)!.firstRegistration, registrationController),
              _buildInputField(AppLocalizations.of(context)!.bodyType, bodyTypeController),
              _buildInputField(AppLocalizations.of(context)!.fuelType, fuelTypeController),
              _buildInputField(AppLocalizations.of(context)!.transmission, transmissionController),
              _buildInputField(AppLocalizations.of(context)!.location, locationLineController),
              _buildInputField(AppLocalizations.of(context)!.mileage, milageController),
              _buildInputField(AppLocalizations.of(context)!.consumer, consumerController),
              const SizedBox(height: 20),
              _buildStepHeader(AppLocalizations.of(context)!.stepTwoFromThree),
              _buildImagePicker(),
              const SizedBox(height: 20),
              _buildRowInputFields(AppLocalizations.of(context)!.finalPrice,finalPriceController, AppLocalizations.of(context)!.power, powerController,
              ),
              const SizedBox(height: 20),
              _buildStepHeader(AppLocalizations.of(context)!.stepThreeFromThree),
              const SizedBox(height: 20),
              _buildSelectionHeader(AppLocalizations.of(context)!.selectEquipment),
              _buildHorizontalScroll(equipmentOptions, selectedEquipment),
              const SizedBox(height: 20),
              _buildSelectionHeader(AppLocalizations.of(context)!.selectBodyColor),
              _buildHorizontalScroll(bodyColors, selectedBodyColors),
              const SizedBox(height: 20),
              _buildSelectionHeader(AppLocalizations.of(context)!.selectInteriorColor),
              _buildHorizontalScroll(interiorColors, selectedInteriorColors),
              const SizedBox(height: 20),
              _buildSelectionHeader(AppLocalizations.of(context)!.selectUpholstery),
              _buildHorizontalScroll(upholsteryOptions, selectedUpholstery),
              const SizedBox(height: 20),
              _buildSelectionHeader(AppLocalizations.of(context)!.vehicleDescription),
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
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                        hintText: AppLocalizations.of(context)!.enterVehicleDescription,
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
                        child:  Center(
                          child: Text(
                            AppLocalizations.of(context)!.finish,
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
            borderRadius: BorderRadius.circular(10)),
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
              ?  Center(
                  child: Text(
                    AppLocalizations.of(context)!.clickToAddImage,
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 16,
                      color: Color(0xFF828282),
                    ),
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              Navigator.pop(context);
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
                child: SvgPicture.asset('assets/images/arrow_back.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
