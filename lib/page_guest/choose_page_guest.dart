import 'package:auto_sopa/base_screen.dart';
import 'package:auto_sopa/util/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChoosePageGuest extends StatefulWidget {
  const ChoosePageGuest({super.key});

  @override
  State<ChoosePageGuest> createState() => _ChoosePageGuestState();
}

class _ChoosePageGuestState extends State<ChoosePageGuest> {
  bool _showMoreFilters = false;
  final List<int> _selectedIndexes = [];
  final List<int> _selectedIndexesFuel = [];
  final List<int> _selectedIndexesEquipment = [];
  final List<int> _selectedIndexesSpace = [];
  final List<int> _selectedIndexesBody = [];
  final List<int> _selectedIndexesInterior = [];
  final List<int> _selectedIndexesUpholstery = [];

  @override
  Widget build(BuildContext context) {
    bool isGuest = true;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Logo
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
            ),
            //Selected container for body type
            SizedBox(
              height: 40,
            ),
            Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: CustomText(
                  text: AppLocalizations.of(context)!.whichBodyType,
                  isBold: false,
                  fontSize: 20,
                  color: Colors.black,
                )),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    buildCarContainer(0, 'assets/images/suvs_icon.png', AppLocalizations.of(context)!.suv),
                    SizedBox(width: 10),
                    buildCarContainer(
                        1, 'assets/images/sedans_icon.png', AppLocalizations.of(context)!.sedan),
                    SizedBox(width: 10),
                    buildCarContainer(
                        2, 'assets/images/hatchbacks_icon.png', AppLocalizations.of(context)!.hatchBack),
                    SizedBox(width: 10),
                    buildCarContainer(
                        3, 'assets/images/convertible_icon.png', AppLocalizations.of(context)!.convertible),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Selected container for fuel type
            Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: CustomText(
                  text: AppLocalizations.of(context)!.whichFuelType,
                  isBold: false,
                  fontSize: 20,
                  color: Colors.black,
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildFuelContainer(0, AppLocalizations.of(context)!.diesel),
                    SizedBox(width: 10),
                    buildFuelContainer(1, AppLocalizations.of(context)!.gasoline),
                    SizedBox(width: 10),
                    buildFuelContainer(2, AppLocalizations.of(context)!.electric),
                    SizedBox(width: 10),
                    buildFuelContainer(3, AppLocalizations.of(context)!.electricGasoline),
                    SizedBox(width: 10),
                    buildFuelContainer(4, AppLocalizations.of(context)!.electricDiesel),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Selected container for equipment
            Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: CustomText(
                  text: AppLocalizations.of(context)!.whichEquipment,
                  isBold: false,
                  fontSize: 20,
                  color: Colors.black,
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildEquipmentContainer(0, AppLocalizations.of(context)!.parkingSensors),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(1,  AppLocalizations.of(context)!.satnav),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(2,  AppLocalizations.of(context)!.appleCarPlay),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(3,  AppLocalizations.of(context)!.androidAuto),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(4,  AppLocalizations.of(context)!.abs),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(5,  AppLocalizations.of(context)!.rearViewCamera),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(6,  AppLocalizations.of(context)!.blindSpotMonitoring),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(7,  AppLocalizations.of(context)!.tirePressure),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(8,  AppLocalizations.of(context)!.climate),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(9,  AppLocalizations.of(context)!.heatedSeats),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(10,  AppLocalizations.of(context)!.coolSeats),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(11,  AppLocalizations.of(context)!.electricAdjustableSeats),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(12,  AppLocalizations.of(context)!.sunroof),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(13,  AppLocalizations.of(context)!.cruiseControl),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(14,  AppLocalizations.of(context)!.touchScreenDisplay),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(15,  AppLocalizations.of(context)!.usbPorts),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(16,  AppLocalizations.of(context)!.wirelessCharger),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(17,  AppLocalizations.of(context)!.turboChargedEngine),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(18,  AppLocalizations.of(context)!.startStopSystem),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(19,  AppLocalizations.of(context)!.ledHeadLights),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(20,  AppLocalizations.of(context)!.roofRails),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(21,  AppLocalizations.of(context)!.fogLights),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(22,  AppLocalizations.of(context)!.electricFoldingMirroring),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(23,  AppLocalizations.of(context)!.fourWd),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Dropdown for show more
            GestureDetector(
              onTap: () {
                setState(() {
                  _showMoreFilters = !_showMoreFilters;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: AppLocalizations.of(context)!.showMoreFilters,
                      isBold: true,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset('assets/images/show_more_icon.svg')
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _showMoreFilters,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  //Selected container for fuel type
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: CustomText(
                        text: AppLocalizations.of(context)!.whichBodyColor,
                        isBold: false,
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildBodyColorContainer(0, AppLocalizations.of(context)!.black),
                          SizedBox(
                            width: 10,
                          ),
                          buildBodyColorContainer(1, AppLocalizations.of(context)!.white),
                          SizedBox(
                            width: 10,
                          ),
                          buildBodyColorContainer(2, AppLocalizations.of(context)!.grey),
                          SizedBox(
                            width: 10,
                          ),
                          buildBodyColorContainer(3, AppLocalizations.of(context)!.green),
                          SizedBox(
                            width: 10,
                          ),
                          buildBodyColorContainer(4, AppLocalizations.of(context)!.darkGreen),
                          SizedBox(
                            width: 10,
                          ),
                          buildBodyColorContainer(5, AppLocalizations.of(context)!.red),
                          SizedBox(
                            width: 10,
                          ),
                          buildBodyColorContainer(6, AppLocalizations.of(context)!.yellow),
                          SizedBox(
                            width: 10,
                          ),
                          buildBodyColorContainer(7, AppLocalizations.of(context)!.blue),
                          SizedBox(
                            width: 10,
                          ),
                          buildBodyColorContainer(8, AppLocalizations.of(context)!.darkBlue),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Selected container for equipment
                  Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: CustomText(
                        text: AppLocalizations.of(context)!.whichInteriorColor,
                        isBold: false,
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildInteriorColorContainer(0, AppLocalizations.of(context)!.black),
                          SizedBox(
                            width: 10,
                          ),
                          buildInteriorColorContainer(1, AppLocalizations.of(context)!.white),
                          SizedBox(
                            width: 10,
                          ),
                          buildInteriorColorContainer(2, AppLocalizations.of(context)!.red),
                          SizedBox(
                            width: 10,
                          ),
                          buildInteriorColorContainer(3, AppLocalizations.of(context)!.darkGreen),
                          SizedBox(
                            width: 10,
                          ),
                          buildInteriorColorContainer(4, AppLocalizations.of(context)!.darkBlue),
                          SizedBox(
                            width: 10,
                          ),
                          buildInteriorColorContainer(5, AppLocalizations.of(context)!.brown)
                        ],
                      ),
                    ),
                  ),
                  //Selected Container for boot space
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: CustomText(
                        text: AppLocalizations.of(context)!.whichUpholstery,
                        isBold: false,
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildUpholsteryContainer(0, AppLocalizations.of(context)!.alcantara),
                          SizedBox(
                            width: 10,
                          ),
                          buildUpholsteryContainer(1, AppLocalizations.of(context)!.cloth),
                          SizedBox(
                            width: 10,
                          ),
                          buildUpholsteryContainer(2, AppLocalizations.of(context)!.fullLeather),
                          SizedBox(
                            width: 10,
                          ),
                          buildUpholsteryContainer(3, AppLocalizations.of(context)!.partLeather),
                          SizedBox(
                            width: 10,
                          ),
                          buildUpholsteryContainer(4, AppLocalizations.of(context)!.velour),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            //Button skip and continue
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation,
                                  secondaryAnimation) =>
                              BaseScreen(
                                  isGuest:
                                      isGuest),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin =
                                Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve =
                                Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                                position: offsetAnimation, child: child);
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF2F89C0),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        AppLocalizations.of(context)!.skip,
                        style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 18,
                            color: Color(0xFF2F89C0)),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF2F89C0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      AppLocalizations.of(context)!.search,
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          fontSize: 18,
                          color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCarContainer(int index, String imagePath, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedIndexes.contains(index)) {
            _selectedIndexes.remove(index); // Hiq indeksin nëse është selektuar
          } else {
            _selectedIndexes
                .add(index); // Shto indeksin nëse nuk është selektuar
          }
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: _selectedIndexes.contains(index) ? 2 : 1,
            color: _selectedIndexes.contains(index)
                ? Color(0xFF2F89C0)
                : Color(0xFF828282), // Ndrysho ngjyrën e border-it
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            Text(
              label,
              style: TextStyle(fontFamily: 'Kanit', fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFuelContainer(int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedIndexesFuel.contains(index)) {
            _selectedIndexesFuel
                .remove(index); // Hiq indeksin nëse është selektuar
          } else {
            _selectedIndexesFuel
                .add(index); // Shto indeksin nëse nuk është selektuar
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            width: _selectedIndexesFuel.contains(index) ? 2 : 1,
            color: _selectedIndexesFuel.contains(index)
                ? Color(0xFF2F89C0)
                : Color(0xFF828282), // Ndrysho ngjyrën e border-it
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontFamily: 'Kanit', fontSize: 17),
          ),
        ),
      ),
    );
  }

  Widget buildEquipmentContainer(int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedIndexesEquipment.contains(index)) {
            _selectedIndexesEquipment.remove(index);
          } else {
            _selectedIndexesEquipment.add(index);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            width: _selectedIndexesEquipment.contains(index) ? 2 : 1,
            color: _selectedIndexesEquipment.contains(index)
                ? Color(0xFF2F89C0)
                : Color(0xFF828282),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          label,
          style: TextStyle(fontSize: 17, fontFamily: 'Kanit'),
        )),
      ),
    );
  }


  Widget buildBodyColorContainer(int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedIndexesBody.contains(index)) {
            _selectedIndexesBody.remove(index);
          } else {
            _selectedIndexesBody.add(index);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            width: _selectedIndexesBody.contains(index) ? 2 : 1,
            color: _selectedIndexesBody.contains(index)
                ? Color(0xFF2F89C0)
                : Color(0xFF828282),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 17, fontFamily: 'Kanit'),
          ),
        ),
      ),
    );
  }

  Widget buildInteriorColorContainer(int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedIndexesInterior.contains(index)) {
            _selectedIndexesInterior.remove(index);
          } else {
            _selectedIndexesInterior.add(index);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            width: _selectedIndexesInterior.contains(index) ? 2 : 1,
            color: _selectedIndexesInterior.contains(index)
                ? Color(0xFF2F89C0)
                : Color(0xFF828282),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 17, fontFamily: 'Kanit'),
          ),
        ),
      ),
    );
  }

  Widget buildUpholsteryContainer(int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedIndexesUpholstery.contains(index)) {
            _selectedIndexesUpholstery.remove(index);
          } else {
            _selectedIndexesUpholstery.add(index);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            width: _selectedIndexesUpholstery.contains(index) ? 2 : 1,
            color: _selectedIndexesUpholstery.contains(index)
                ? Color(0xFF2F89C0)
                : Color(0xFF828282),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 17, fontFamily: 'Kanit'),
          ),
        ),
      ),
    );
  }
}
