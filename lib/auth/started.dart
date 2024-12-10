import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_sopa/auth/login.dart';
import 'package:auto_sopa/page_guest/choose_page_guest.dart';
import 'package:auto_sopa/util/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../util/local_provider.dart';

class Started extends StatefulWidget {
  const Started({super.key});

  @override
  State<Started> createState() => _StartedState();
}

class _StartedState extends State<Started> {
  String selectedLanguage = 'en';

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/images/sq_flag.svg',
                  width: 40,
                ),
                title: const Text(
                  'Shqip',
                  style: TextStyle(fontFamily: 'Kanit'),
                ),
                trailing: selectedLanguage == 'sq' ? const Icon(Icons.check) : null,
                onTap: () {
                  setState(() {
                    selectedLanguage = 'sq';
                  });
                  Provider.of<LocaleProvider>(context, listen: false)
                      .setLocale(const Locale('sq'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/images/usa_flag.svg',
                  width: 40,
                ),
                title: const Text(
                  'English',
                  style: TextStyle(fontFamily: 'Kanit'),
                ),
                trailing: selectedLanguage == 'en' ? const Icon(Icons.check) : null,
                onTap: () {
                  setState(() {
                    selectedLanguage = 'en';
                  });
                  Provider.of<LocaleProvider>(context, listen: false)
                      .setLocale(const Locale('en'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/images/de_flag.svg',
                  width: 40,
                ),
                title: const Text(
                  'Deutsch',
                  style: TextStyle(fontFamily: 'Kanit'),
                ),
                trailing: selectedLanguage == 'de' ? const Icon(Icons.check) : null,
                onTap: () {
                  setState(() {
                    selectedLanguage = 'de';
                  });
                  Provider.of<LocaleProvider>(context, listen: false)
                      .setLocale(const Locale('de'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset('assets/images/info_icon.svg'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Center(
              child: SvgPicture.asset('assets/images/logo.svg'),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                  const Login(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween =
                    Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(position: offsetAnimation, child: child);
                  },
                ),
              );
            },
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF2F89C0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CustomText(
                  text: AppLocalizations.of(context)!.login,
                  isBold: false,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                  const ChoosePageGuest(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;

                    var tween =
                    Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(position: offsetAnimation, child: child);
                  },
                ),
              );
            },
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xFF2F89C0),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CustomText(
                  text: AppLocalizations.of(context)!.continueAsGuest,
                  isBold: false,
                  fontSize: 22,
                  color: const Color(0xFF2F89C0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: GestureDetector(
              onTap: () => _showLanguageSelector(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: AppLocalizations.of(context)!.chooseLanguage,
                    isBold: false,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset('assets/images/earth_icon.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
