import 'package:auto_sopa/page_guest/home_page_guest.dart';
import 'package:auto_sopa/page_guest/save_page_guest.dart';
import 'package:auto_sopa/page_guest/settings_guest.dart';
import 'package:auto_sopa/page_owner/edit_owner.dart';
import 'package:auto_sopa/page_owner/home_page_owner.dart';
import 'package:auto_sopa/page_owner/settings_owner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../util/add_car.dart';

class BaseScreen extends StatefulWidget {
  final bool isGuest;
  final List<Car>? filteredCars; // Lista e veturave të filtruara

  BaseScreen({super.key, required this.isGuest, this.filteredCars});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lista e faqeve të pronarit
    final List<Widget> pagesOwner = [
      HomePageOwner(),
      EditOwner(),
      SettingsOwner(),
    ];

    // Lista e faqeve për mysafirë me filtrim
    final List<Widget> pagesGuest = [
      HomePageGuest(
        // Përdor veturat e filtruara, ose të gjitha veturat kur `filteredCars` është null/bosh
        filteredCars: widget.filteredCars ?? [],
      ),
      SavePageGuest(),
      SettingsGuest(),
    ];

    // Zgjidh faqet bazuar në rolin
    final List<Widget> selectedPage = widget.isGuest ? pagesGuest : pagesOwner;

    // Ikonat për mysafirë
    final List<Map<String, String>> iconsGuest = [
      {'icon': 'assets/images/home_icon.svg', 'label': ''},
      {'icon': 'assets/images/save_icon.svg', 'label': ''},
      {'icon': 'assets/images/settings_icon.svg', 'label': ''},
    ];

    // Ikonat për pronar
    final List<Map<String, String>> iconsOwner = [
      {'icon': 'assets/images/home_icon.svg', 'label': ''},
      {'icon': 'assets/images/edit_icon.svg', 'label': ''},
      {'icon': 'assets/images/settings_icon.svg', 'label': ''},
    ];

    // Zgjidh ikonat bazuar në rolin
    final icons = widget.isGuest ? iconsGuest : iconsOwner;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: selectedPage[_selectedIndex], // Faqja aktuale
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0), // Margin nga fundi dhe anët
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF2F89C0),
            borderRadius: BorderRadius.circular(30), // Borderradius për kornizat
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              icons.length,
                  (index) => GestureDetector(
                onTap: () => _navigateBottomBar(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? Colors.white
                        : const Color(0xFF2F89C0), // Ndryshon ngjyrën kur është i zgjedhur
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SvgPicture.asset(
                    icons[index]['icon']!,
                    color: _selectedIndex == index
                        ? Colors.black
                        : Colors.white,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
