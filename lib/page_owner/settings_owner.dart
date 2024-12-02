import 'package:auto_sopa/auth/started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SettingsOwner extends StatefulWidget {
  const SettingsOwner({super.key});

  @override
  State<SettingsOwner> createState() => _SettingsOwnerState();
}

class _SettingsOwnerState extends State<SettingsOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                //Profile Details
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/profil_icon.svg'),
                      SizedBox(height: 10,),
                      Text('John Smith',style: TextStyle(fontSize: 30,fontFamily: 'Kanit',fontWeight: FontWeight.bold),),
                      // SizedBox(height: 5,),
                      Text('johnsmith@gmail.com',style: TextStyle(fontSize: 17,fontFamily: 'Kanit',color: Color(0xFF828282)),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              //Notifications Column
              Container(
                height: 40,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Notifications',style: TextStyle(fontFamily: 'Kanit',fontSize: 16),),
                      SvgPicture.asset('assets/images/arrow_forward.svg')
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //Services Column
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text('SERVICES',style: TextStyle(fontSize: 16,fontFamily: 'Kanit',fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 40,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Feedback',style: TextStyle(fontFamily: 'Kanit',fontSize: 16),),
                          SvgPicture.asset('assets/images/arrow_forward.svg')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2,),
                  Container(
                    height: 40,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Recommendation',style: TextStyle(fontFamily: 'Kanit',fontSize: 16),),
                          SvgPicture.asset('assets/images/arrow_forward.svg')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              //Legal Column
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text('LEGAL',style: TextStyle(fontSize: 16,fontFamily: 'Kanit',fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 40,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Imprint',style: TextStyle(fontFamily: 'Kanit',fontSize: 16),),
                          SvgPicture.asset('assets/images/arrow_forward.svg')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2,),
                  Container(
                    height: 40,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('General terms and conditions',style: TextStyle(fontFamily: 'Kanit',fontSize: 16),),
                          SvgPicture.asset('assets/images/arrow_forward.svg')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2,),
                  Container(
                    height: 40,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Privacy policy',style: TextStyle(fontFamily: 'Kanit',fontSize: 16),),
                          SvgPicture.asset('assets/images/arrow_forward.svg')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2,),
                  Container(
                    height: 40,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Declaration of Consent',style: TextStyle(fontFamily: 'Kanit',fontSize: 16),),
                          SvgPicture.asset('assets/images/arrow_forward.svg')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2,),
                  Container(
                    height: 40,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Privacy Manager',style: TextStyle(fontFamily: 'Kanit',fontSize: 16),),
                          SvgPicture.asset('assets/images/arrow_forward.svg')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35,),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Started())),
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF2F89C0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Log out',style: TextStyle(fontFamily: 'Kanit',color: Colors.white,fontSize: 20),),
                      SizedBox(width: 10,),
                      SvgPicture.asset('assets/images/logout_icon.svg',width: 25,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
            ],
          ),
        ),
      )
    );
  }
}
