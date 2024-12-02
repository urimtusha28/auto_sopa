import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_sopa/util/custom_text.dart';
import 'package:auto_sopa/base_screen.dart'; // Importo BaseScreen

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isGuest = false;
  bool checkedValue = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Email dhe Password të autorizuara
  final String validEmail = 'urimtusha@gmail.com';
  final String validPassword = 'Urimtusha12';

  void _login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Kontrollo nëse fushat janë bosh
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ju lutemi plotësoni të gjitha fushat!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    } else if (email == validEmail && password == validPassword) {
      // Nëse kredencialet janë të sakta, shko te BaseScreen
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              BaseScreen(isGuest: isGuest),
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
    } else {
      // Nëse kredencialet janë të pasakta
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email ose password i pasaktë!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
          child: Column(
            children: [
              SvgPicture.asset('assets/images/logo.svg'),
              const SizedBox(height: 40),
              Center(
                child: CustomText(
                  text: 'Login',
                  isBold: true,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'johnsmith@gmail.com',
                  hintStyle: const TextStyle(
                    fontFamily: 'Kanit',
                    color: Color(0xFF828282),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: '***********',
                  hintStyle: const TextStyle(
                    fontFamily: 'Kanit',
                    color: Color(0xFF828282),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue!;
                      });
                    },
                    activeColor: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _login,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Veprimi për kthim prapa
                      },
                      child: Container(
                        width: 50,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: SvgPicture.asset(
                            'assets/images/arrow_back.svg',
                            color: const Color(0xFF2F89C0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 290,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF2F89C0),
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
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomText(
                  text: 'Forget password',
                  isBold: false,
                  fontSize: 20,
                  color: const Color(0xFF2F89C0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
