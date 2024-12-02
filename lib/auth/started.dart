import 'package:auto_sopa/auth/login.dart';
import 'package:auto_sopa/page_guest/choose_page_guest.dart';
import 'package:auto_sopa/util/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Started extends StatelessWidget {
  const Started({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset('assets/images/info_icon.svg'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
            child: Center(
              child: SvgPicture.asset('assets/images/logo.svg'),
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => Login(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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
                color: Color(0xFF2F89C0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CustomText(
                  text: 'Login',
                  isBold: false,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => ChoosePageGuest(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);  // Lëvizja nga e djathta
                    const end = Offset.zero;  // Pozita përfundimtare
                    const curve = Curves.easeInOut;  // Kurva e animacionit

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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
                  color: Color(0xFF2F89C0),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CustomText(
                  text: 'Continue as guest',
                  isBold: false,
                  fontSize: 22,
                  color: Color(0xFF2F89C0),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 100),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CustomText(text: 'Already, have an account?', isBold: false, fontSize: 20, color: Colors.black)
                      ],
                    ),
                    SizedBox(width: 4,),
                    GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Login())),
                      child: Row(
                        children: [
                          CustomText(text: 'Sign in', isBold: false, fontSize: 20, color: Color(0xFF2F89C0))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Center(child: CustomText(text: 'Forget password', isBold: false, fontSize: 20, color: Color(0xFF2F89C0)))
              ],
            ),
          ),

        ],
      )
    );
  }
}
