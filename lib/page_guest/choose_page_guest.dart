import 'package:auto_sopa/base_screen.dart';
import 'package:auto_sopa/util/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../util/add_car.dart';

class ChoosePageGuest extends StatefulWidget {
  const ChoosePageGuest({super.key});

  @override
  State<ChoosePageGuest> createState() => _ChoosePageGuestState();
}

class _ChoosePageGuestState extends State<ChoosePageGuest> {
  final List<String> _selectedBodyTypes = [];
  final List<String> _selectedFuelTypes = [];
  final List<String> _selectedTransmissions = [];
  final List<String> _selectedUpholsteries = [];
  final List<String> _selectedEquipment = [];



  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    // Filtrimi i veturave
    final filteredCars = carProvider.cars.where((car) {
      // Kontrollo vetëm filtrat që janë zgjedhur
      if (_selectedBodyTypes.isNotEmpty && !_selectedBodyTypes.contains(car.bodyType)) {
        return false; // Nëse bodyType nuk përputhet, kalo tutje
      }
      if (_selectedFuelTypes.isNotEmpty && !_selectedFuelTypes.contains(car.fuelType)) {
        return false; // Nëse fuelType nuk përputhet, kalo tutje
      }
      if (_selectedTransmissions.isNotEmpty && !_selectedTransmissions.contains(car.transmission)) {
        return false; // Nëse transmission nuk përputhet, kalo tutje
      }
      if (_selectedUpholsteries.isNotEmpty && !_selectedUpholsteries.contains(car.upholstery)) {
        return false; // Nëse upholstery nuk përputhet, kalo tutje
      }
      if (_selectedEquipment.isNotEmpty) {
        // Kontrollo nëse të gjitha pajisjet e zgjedhura janë në pajisjet e veturës
        final hasAllSelectedEquipment = _selectedEquipment.every((equipment) => car.equipment.contains(equipment));
        if (!hasAllSelectedEquipment) {
          return false; // Nëse pajisjet nuk përputhen, kalo tutje
        }
      }
      return true; // Nëse të gjitha kushtet përputhen, shto veturën në rezultat
    }).toList();


    final int filteredCarCount = filteredCars.length; // Numri i veturave të filtruara


    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
            ),
            const SizedBox(height: 40),
            // Filtrat
            _buildFilterSection(
              AppLocalizations.of(context)!.whichBodyType,
              [
                AppLocalizations.of(context)!.suv,
                AppLocalizations.of(context)!.sedan,
                AppLocalizations.of(context)!.compact,
                AppLocalizations.of(context)!.convertible,
                AppLocalizations.of(context)!.coupe,
                AppLocalizations.of(context)!.stationWagon,
                AppLocalizations.of(context)!.van,
                AppLocalizations.of(context)!.transporter,
              ],
              _selectedBodyTypes,
            ),
            _buildFilterSection(
              AppLocalizations.of(context)!.whichFuelType,
              [
                AppLocalizations.of(context)!.diesel,
                AppLocalizations.of(context)!.gasoline,
                AppLocalizations.of(context)!.electric,
                AppLocalizations.of(context)!.hybrid,
                AppLocalizations.of(context)!.lpg,
              ],
              _selectedFuelTypes,
            ),
            _buildFilterSection(
              AppLocalizations.of(context)!.selectTransmission,
              [
                AppLocalizations.of(context)!.automatic,
                AppLocalizations.of(context)!.semiAutomatic,
                AppLocalizations.of(context)!.manual,
                AppLocalizations.of(context)!.fOneShift,
              ],
              _selectedTransmissions,
            ),
            _buildFilterSection(
              AppLocalizations.of(context)!.whichUpholstery,
              [
                AppLocalizations.of(context)!.fullLeather,
                AppLocalizations.of(context)!.partLeather,
                AppLocalizations.of(context)!.alcantara,
                AppLocalizations.of(context)!.cloth,
                AppLocalizations.of(context)!.velour,
              ],
              _selectedUpholsteries,
            ),
            _buildFilterSection(
              AppLocalizations.of(context)!.whichEquipment,
              [
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
              ],
              _selectedEquipment,
            ),
            const SizedBox(height: 50),
            // Buttonat Skip dhe Search
            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (filteredCars.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AppLocalizations.of(context)!.noResultsForThisVehicle,
                            ),
                          ),
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BaseScreen(
                            isGuest: true,
                            filteredCars: filteredCars,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2F89C0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '${AppLocalizations.of(context)!.search} ($filteredCarCount)', // Përfshin numrin e veturave
                          style: const TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BaseScreen(
                            isGuest: true,
                            filteredCars: carProvider.cars,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFF2F89C0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.skip,
                          style: const TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 18,
                            color: Color(0xFF2F89C0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(
      String title, List<String> options, List<String> selectedList) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomText(
            text: title,
            isBold: false,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: options.map<Widget>((option) {
                final isSelected = selectedList.contains(option);
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedList.remove(option);
                          } else {
                            selectedList.add(option);
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: isSelected ? 2 : 1,
                            color: isSelected
                                ? const Color(0xFF2F89C0)
                                : const Color(0xFF828282),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Kanit',
                              color: isSelected
                                  ? const Color(0xFF2F89C0)
                                  : const Color(0xFF828282),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // Hapësira mes elementeve
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

}
