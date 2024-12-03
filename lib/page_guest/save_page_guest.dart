import 'package:auto_sopa/page_guest/see_more_details_guest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../util/add_car.dart';
import '../util/custom_text.dart';

class SavePageGuest extends StatelessWidget {
  const SavePageGuest({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);
    final favoriteCars = carProvider.favoriteCars
        .map((index) => carProvider.cars[index])
        .toList(); // Merr vetëm veturat e preferuara.

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
            child: Column(
              children: [
                if (favoriteCars.isEmpty)
                  Center(
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/lottie/Animation_1.json', // Shto rrugën e skedarit Lottie
                          width: 250,
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                         Text(
                          AppLocalizations.of(context)!.noFavoriteCarsAdded,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey,
                            fontFamily: 'Kanit',
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  for (var car in favoriteCars) _buildCarCard(context, car),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarCard(BuildContext context, Car car) {
    return Container(
      width: 380,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFFFFF),
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
                    height: 250,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    'assets/images/image_car_3.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                CustomText(
                  text: car.make,
                  isBold: true,
                  fontSize: 27,
                  color: Colors.black,
                ),
                const SizedBox(width: 10),
                CustomText(
                  text: car.model,
                  isBold: true,
                  fontSize: 27,
                  color: Colors.black,
                ),
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
                  color: const Color(0xFF828282),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/images/road_icon.svg'),
                const SizedBox(width: 3),
                CustomText(
                  text: car.milage,
                  isBold: false,
                  fontSize: 17,
                  color: const Color(0xFF828282),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/images/fuel_type_icon.svg'),
                const SizedBox(width: 3),
                CustomText(
                  text: car.fuelType,
                  isBold: false,
                  fontSize: 17,
                  color: const Color(0xFF828282),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/images/transmission_icon.svg'),
                const SizedBox(width: 3),
                CustomText(
                  text: car.transmission,
                  isBold: false,
                  fontSize: 17,
                  color: const Color(0xFF828282),
                ),
              ],
            ),
          ),
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
                    fontSize: 18,
                    color: const Color(0xFF828282),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
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
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SeeMoreDetailsGuest(car: car),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        var fadeAnimation =
                        animation.drive(Tween(begin: 0.0, end: 1.0));

                        return FadeTransition(
                          opacity: fadeAnimation,
                          child:
                          SlideTransition(position: offsetAnimation, child: child),
                        );
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 10),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              text: AppLocalizations.of(context)!.seeMore,
                              isBold: false,
                              fontSize: 20,
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
            ],
          ),
        ],
      ),
    );
  }
}
