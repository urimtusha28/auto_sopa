import 'package:auto_sopa/util/custom_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../util/add_car.dart';

class SeeMoreDetailsGuest extends StatefulWidget {
  final Car car;

  const SeeMoreDetailsGuest({required this.car, super.key});

  @override
  State<SeeMoreDetailsGuest> createState() => _SeeMoreDetailsGuestState();
}

class _SeeMoreDetailsGuestState extends State<SeeMoreDetailsGuest> {
  int myCurrentIndes = 0;
  String displayInfo = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSearchAndFilter(),
              SizedBox(height: 20,),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  height: 200,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      myCurrentIndes = index;
                    });
                  },
                ),
                items: widget.car.images.isNotEmpty
                    ? widget.car.images
                    .map((image) => Image.file(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ))
                    .toList()
                    : [
                  Image.asset(
                    'assets/images/image_car_3.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.car.images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => setState(() {
                      myCurrentIndes = entry.key;
                    }),
                    child: Container(
                      width: myCurrentIndes == entry.key ? 12.0 : 8.0,
                      height: myCurrentIndes == entry.key ? 12.0 : 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: myCurrentIndes == entry.key
                            ? Colors.black
                            : Colors.grey.withOpacity(0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    CustomText(text: '${widget.car.make} ${widget.car.model}', isBold: true, fontSize: 25, color: Colors.black)
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDetailColumn(AppLocalizations.of(context)!.mileage, widget.car.milage),
                    _buildDetailColumn(AppLocalizations.of(context)!.transmission, widget.car.transmission),
                    _buildDetailColumn(AppLocalizations.of(context)!.firstRegistration, widget.car.registration),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDetailColumn(AppLocalizations.of(context)!.fuelType, widget.car.fuelType),
                    _buildDetailColumn(AppLocalizations.of(context)!.power, '${widget.car.power}hp'),
                    _buildDetailColumn(AppLocalizations.of(context)!.consumer, '${widget.car.consumer} l/100(comb.)'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      '${widget.car.price.toStringAsFixed(0)} €',
                      style: const TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/location_color_icon.svg'),
                    const SizedBox(width: 5),
                    Text(
                      widget.car.location,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Kanit',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Dropdown for Equipment
              ExpansionTile(
                title:  Text(
                  AppLocalizations.of(context)!.equipment,
                  style: TextStyle(fontFamily: 'Kanit', fontSize: 22),
                ),
                children: [
                  widget.car.equipment.isNotEmpty
                      ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.car.equipment
                          .map((item) => Text(
                        '- $item',
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Kanit',
                          color: Colors.black,
                        ),
                      ))
                          .toList(),
                    ),
                  )
                      :  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      AppLocalizations.of(context)!.noEquipmentAvailable,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Kanit',
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),

              // Dropdown for Color and Interior
              ExpansionTile(
                title:  Text(AppLocalizations.of(context)!.colorAndInterior,
                  style: TextStyle(fontFamily: 'Kanit', fontSize: 22),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.bodyColor}: ${widget.car.bodyColor}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${AppLocalizations.of(context)!.upholstery}: ${widget.car.upholstery}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${AppLocalizations.of(context)!.colorAndInterior}: ${widget.car.interiorColor}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Dropdown for Vehicle Description
              ExpansionTile(
                title:  Text(
                  AppLocalizations.of(context)!.vehicleDescription,
                  style: TextStyle(fontFamily: 'Kanit', fontSize: 22),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      widget.car.description.isNotEmpty
                          ? widget.car.description
                          : AppLocalizations.of(context)!.noDescriptionAvailable,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Kanit',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                displayInfo = '${AppLocalizations.of(context)!.callSeller}: 046571571';
                              });
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF2F89C0),
                              ),
                              child:  Center(
                                child: Text(
                                  AppLocalizations.of(context)!.callSeller,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Kanit',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                displayInfo = '${AppLocalizations.of(context)!.emailSeller}: urimtusha@gmail.com';
                              });
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF2F89C0),
                              ),
                              child:  Center(
                                child: Text(
                                  AppLocalizations.of(context)!.email,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Kanit',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (displayInfo.isNotEmpty)
                      Text(
                        displayInfo,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Kanit',
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailColumn(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Kanit',
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Kanit',
          ),
        ),
      ],
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
