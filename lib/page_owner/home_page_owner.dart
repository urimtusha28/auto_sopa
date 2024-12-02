import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../util/add_car.dart';
import '../util/custom_text.dart';
import 'add_car_owner.dart';

class HomePageOwner extends StatefulWidget {
  const HomePageOwner({super.key});

  @override
  State<HomePageOwner> createState() => _HomePageOwnerState();
}

class _HomePageOwnerState extends State<HomePageOwner> {
  @override
  Widget build(BuildContext context) {
    final cars = Provider.of<CarProvider>(context).cars;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddCarOwner()),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -25,
                            left: 15,
                            right: 15,
                            child: Container(
                              width: 200,
                              height: 120,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8E8E8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Container(
                            width: 350,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/images/add_icon.svg',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                for (var car in cars) _buildCarCard(car),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarCard(Car car) {
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
          // Image and icon
          Padding(
            padding: const EdgeInsets.all(7), // Padding nga të gjitha anët
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Radius për imazhin
                color: const Color(0xFFF5F5F5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: car.images.isNotEmpty
                    ? Image.file(
                  car.images.first,
                  fit: BoxFit.contain, // Ruaj përmasat e imazhit
                )
                    : Image.asset(
                  'assets/images/image_car_3.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // Title and details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                CustomText(
                    text: car.make,
                    isBold: true,
                    fontSize: 25,
                    color: Colors.black),
                const SizedBox(
                  width: 10,
                ),
                CustomText(
                    text: car.model,
                    isBold: true,
                    fontSize: 25,
                    color: Colors.black)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/calendar_icon.svg'),
                SizedBox(width: 3,),
                CustomText(
                    text: car.registration,
                    isBold: false,
                    fontSize: 17,
                    color: const Color(0xFF828282)),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/images/road_icon.svg'),
                SizedBox(width: 3,),
                CustomText(
                    text: car.milage,
                    isBold: false,
                    fontSize: 17,
                    color: const Color(0xFF828282)),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/images/fuel_type_icon.svg'),
                SizedBox(width: 3,),
                CustomText(
                    text: car.fuelType,
                    isBold: false,
                    fontSize: 17,
                    color: const Color(0xFF828282)),
                const SizedBox(width: 10),
                SvgPicture.asset('assets/images/transmission_icon.svg'),
                SizedBox(width: 3,),
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
                CustomText(
                    text: car.location,
                    isBold: false,
                    fontSize: 20,
                    color: const Color(0xFF828282))
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomText(
                text: '${car.price.toStringAsFixed(0)} €',
                isBold: true,
                fontSize: 28,
                color: Colors.black),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

}
