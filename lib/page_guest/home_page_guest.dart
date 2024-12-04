import 'package:auto_sopa/page_guest/see_more_details_guest.dart';
import 'package:auto_sopa/util/add_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../util/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageGuest extends StatefulWidget {
  const HomePageGuest({super.key});

  @override
  State<HomePageGuest> createState() => _HomePageGuestState();
}

class _HomePageGuestState extends State<HomePageGuest> {
  @override
  Widget build(BuildContext context) {
    final cars = Provider.of<CarProvider>(context).cars;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: cars.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lottie/Animation_4.json', // Rruga e animacionit Lottie
                  width: 250,
                  height: 250,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                 CustomText(text: AppLocalizations.of(context)!.noCarsAvailable, isBold: false, fontSize: 25, color: Colors.grey)
              ],
            ),
          )
              : Column(
            children: [
              _buildSearchAndFilter(),
              const SizedBox(height: 20),
              for (var i = 0; i < cars.length; i++) _buildCarCard(cars[i], i),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: SvgPicture.asset('assets/images/arrow_back.svg'),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Filter Button with Dropdown
          PopupMenuButton<String>(
            icon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF2F89C0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset('assets/images/filter_icon.svg'),
              ),
            ),
            onSelected: (String value) {
              _sortCars(value); // Thërret funksionin për renditje
            },
            itemBuilder: (BuildContext context) {
              return [
                 PopupMenuItem(
                  value: 'price_high',
                  child: Text(AppLocalizations.of(context)!.priceHighToLow,style: TextStyle(fontFamily: 'Kanit',fontSize: 15),),
                ),
                 PopupMenuItem(
                  value: 'price_low',
                  child: Text(AppLocalizations.of(context)!.priceLowToHigh,style: TextStyle(fontFamily: 'Kanit',fontSize: 15)),
                ),
                 PopupMenuItem(
                  value: 'milage_low',
                  child: Text(AppLocalizations.of(context)!.mileageLowToHigh,style: TextStyle(fontFamily: 'Kanit',fontSize: 15)),
                ),
                 PopupMenuItem(
                  value: 'milage_high',
                  child: Text(AppLocalizations.of(context)!.mileageHighToLow,style: TextStyle(fontFamily: 'Kanit',fontSize: 15)),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCarCard(Car car, int index) {
    final carProvider = Provider.of<CarProvider>(context);

    return Container(
      width: 380,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Favorite Icon and Image
          Padding(
            padding: const EdgeInsets.all(7),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: car.images.isNotEmpty
                      ? Image.file(
                    car.images.first,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    'assets/images/image_car_3.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      carProvider
                          .toggleFavorite(index); // Menaxhoni preferencat
                    },
                    child: SvgPicture.asset(
                      carProvider.isFavorite(index)
                          ? 'assets/images/heart_added.svg'
                          : 'assets/images/heart_add.svg',
                      width: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Title and Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                CustomText(
                    text: car.make,
                    isBold: true,
                    fontSize: 25,
                    color: Colors.black),
                const SizedBox(width: 10),
                CustomText(
                    text: car.model,
                    isBold: true,
                    fontSize: 25,
                    color: Colors.black),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/calendar_icon.svg'),
                const SizedBox(width: 3),
                CustomText(
                    text: car.registration,
                    isBold: false,
                    fontSize: 17,
                    color: const Color(0xFF828282)),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/images/road_icon.svg'),
                const SizedBox(width: 3),
                CustomText(
                    text: car.milage,
                    isBold: false,
                    fontSize: 17,
                    color: const Color(0xFF828282)),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/images/fuel_type_icon.svg'),
                const SizedBox(width: 3),
                CustomText(
                    text: car.fuelType,
                    isBold: false,
                    fontSize: 17,
                    color: const Color(0xFF828282)),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/images/transmission_icon.svg'),
                const SizedBox(width: 3),
                CustomText(
                    text: car.transmission,
                    isBold: false,
                    fontSize: 17,
                    color: const Color(0xFF828282)),
              ],
            ),
          ),

          // Location
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/location_color_icon.svg'),
                const SizedBox(width: 5),
                Flexible(
                    child: CustomText(
                        text: car.location,
                        isBold: false,
                        fontSize: 20,
                        color: const Color(0xFF828282))),
              ],
            ),
          ),

          // Price and "See More"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomText(
                    text: '${car.price.toStringAsFixed(0)} €',
                    isBold: true,
                    fontSize: 28,
                    color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SeeMoreDetailsGuest(car: car),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        // Animacioni i lëvizjes nga e djathta në të majtë
                        const begin = Offset(1.0, 0.0);  // Lëvizja nga e djathta
                        const end = Offset.zero;  // Pozita përfundimtare
                        const curve = Curves.easeInOut;  // Kurva e animacionit

                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        // Animacioni i kalimit me zbehje
                        var fadeAnimation = animation.drive(Tween(begin: 0.0, end: 1.0));

                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: SlideTransition(position: offsetAnimation, child: child),
                        );
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 0),
                  child: Container(
                    width: 180,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F89C0),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 5),
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                text: AppLocalizations.of(context)!.seeMore,
                                isBold: false,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              SvgPicture.asset(
                                'assets/images/arrow_forward.svg',
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ],
      ),
    );
  }

  void _sortCars(String criteria) {
    final carProvider = Provider.of<CarProvider>(context, listen: false);

    switch (criteria) {
      case 'price_high':
        carProvider.cars.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'price_low':
        carProvider.cars.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'milage_low':
        carProvider.cars.sort(
                (a, b) => int.parse(a.milage).compareTo(int.parse(b.milage)));
        break;
      case 'milage_high':
        carProvider.cars.sort(
                (a, b) => int.parse(b.milage).compareTo(int.parse(a.milage)));
        break;
    }

    setState(() {}); // Rifreskon ndërfaqen për të reflektuar renditjen
  }
}
