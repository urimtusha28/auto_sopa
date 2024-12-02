import 'package:auto_sopa/base_screen.dart';
import 'package:auto_sopa/page_guest/home_page_guest.dart';
import 'package:auto_sopa/util/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              padding:  EdgeInsets.only(left: 10, right: 10),
              child: CustomText(text: 'Which body types would you consider for your new car?', isBold: false, fontSize: 20,color: Colors.black,)
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    buildCarContainer(0, 'assets/images/suvs_icon.png', 'SUV'),
                    SizedBox(width: 10),
                    buildCarContainer(
                        1, 'assets/images/sedans_icon.png', 'Sedan'),
                    SizedBox(width: 10),
                    buildCarContainer(
                        2, 'assets/images/hatchbacks_icon.png', 'Hatchback'),
                    SizedBox(width: 10),
                    buildCarContainer(
                        3, 'assets/images/convertible_icon.png', 'Convertible'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Selected container for fuel type
            Padding(
              padding:  EdgeInsets.only(left: 10, right: 10),
              child: CustomText(text: 'Which fuel type would you like?', isBold: false, fontSize: 20,color: Colors.black,)
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildFuelContainer(0, 'Diesel'),
                    SizedBox(width: 10),
                    buildFuelContainer(1, 'Gasoline'),
                    SizedBox(width: 10),
                    buildFuelContainer(2, 'Electric'),
                    SizedBox(width: 10),
                    buildFuelContainer(3, 'Hybrid'),
                    SizedBox(width: 10,),
                    buildFuelContainer(4, 'Electric/Gasoline')
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
              child: CustomText(text: 'Which popular standard equipement do you want?', isBold: false, fontSize: 20,color: Colors.black,)
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildEquipmentContainer(0, 'Parking sensors'),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(1, 'Satnav'),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(2, 'Apple CarPlay'),
                    const SizedBox(
                      width: 10,
                    ),
                    buildEquipmentContainer(3, 'Climate'),
                  ],
                ),
              ),
            ),

            //Selected Container for boot space

            const SizedBox(
              height: 20,
            ),
             Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: CustomText(text: 'What’s the minimum boot space you need?', isBold: false, fontSize: 20,color: Colors.black,)
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildSpaceContainer(0,'1 suitcase(120 litres'),
                    SizedBox(
                      width: 10,
                    ),
                    buildSpaceContainer(1,'2 suitcase(240 litres'),
                    SizedBox(
                      width: 10,
                    ),
                    buildSpaceContainer(2,'3 suitcase(360 litres'),
                    SizedBox(
                      width: 10,
                    ),
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
                     CustomText(text: 'Show more filters', isBold: true, fontSize: 24,color: Colors.black,),
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
                    child: CustomText(text: 'Which body color would you like?',isBold: false,fontSize: 20,color: Colors.black,)
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildBodyColorContainer(0,'Black'),
                          SizedBox(
                            width: 10,
                          ),
                          buildBodyColorContainer(1,'White'),
                          SizedBox(
                            width: 10,
                          ),
                          buildBodyColorContainer(2,'Grey'),
                          SizedBox(
                            width: 10,
                          ),
                          buildBodyColorContainer(3,'Green'),
                          SizedBox(width: 10,),
                          buildBodyColorContainer(4,'Darkgreen'),
                          SizedBox(width: 10,),
                          buildBodyColorContainer(5, 'Red'),
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
                    child: CustomText(text: 'Which interior color do you like?', isBold: false, fontSize: 20,color: Colors.black,)
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildInteriorColorContainer(0, 'Black'),
                          SizedBox(
                            width: 10,
                          ),
                          buildInteriorColorContainer(1, 'White'),
                          SizedBox(
                            width: 10,
                          ),
                          buildInteriorColorContainer(2, 'Brown'),
                          SizedBox(
                            width: 10,
                          ),
                          buildInteriorColorContainer(3, 'Red'),
                          SizedBox(
                            width: 10,
                          ),
                          buildInteriorColorContainer(4, 'Green'),
                          SizedBox(width: 10,),
                          buildInteriorColorContainer(5, 'Dark Wood')
                        ],
                      ),
                    ),
                  ),
                  //Selected Container for boot space
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 10, right: 10),
                    child: CustomText(text: 'Which upholstery would you like?', isBold: false, fontSize: 20,color: Colors.black,)
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildUpholsteryContainer(0,'Alcantara'),
                          SizedBox(
                            width: 10,
                          ),
                          buildUpholsteryContainer(1,'Cloth'),
                          SizedBox(
                            width: 10,
                          ),
                          buildUpholsteryContainer(2,'Full Leather'),
                          SizedBox(
                            width: 10,
                          ),
                          buildUpholsteryContainer(3,'Part Leather'),
                          SizedBox(
                            width: 10,
                          ),
                          buildUpholsteryContainer(4,'Velour'),
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
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              BaseScreen(isGuest: isGuest),  // Këtu kalojmë në BaseScreen
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
                            'Skip',
                            style: TextStyle(
                                fontFamily: 'Kanit', fontSize: 18, color: Color(0xFF2F89C0)),
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
                      'Continue',
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

  Widget buildSpaceContainer(int index, String label){
    return GestureDetector(
      onTap: (){
        setState(() {
          if(_selectedIndexesSpace.contains(index)){
            _selectedIndexesSpace.remove(index);
          }else{
            _selectedIndexesSpace.add(index);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            width: _selectedIndexesSpace.contains(index) ? 2 : 1,
            color: _selectedIndexesSpace.contains(index) ? Color(0xFF2F89C0) : Color(0xFF828282),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(label,style: TextStyle(fontFamily: 'Kanit',fontSize: 17),),
        ),
      ),
    );
  }

  Widget buildBodyColorContainer(int index, String label){
    return GestureDetector(
      onTap: (){
        setState(() {
          if(_selectedIndexesBody.contains(index)){
            _selectedIndexesBody.remove(index);
          }else{
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
            color: _selectedIndexesBody.contains(index) ? Color(0xFF2F89C0) : Color(0xFF828282),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(label,style: TextStyle(fontSize: 17,fontFamily: 'Kanit'),),
        ),
      ),
    );
  }

  Widget buildInteriorColorContainer(int index, String label){
    return GestureDetector(
      onTap: (){
        setState(() {
          if(_selectedIndexesInterior.contains(index)){
            _selectedIndexesInterior.remove(index);
          }else{
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
            color: _selectedIndexesInterior.contains(index) ? Color(0xFF2F89C0) : Color(0xFF828282),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(label,style: TextStyle(fontSize: 17,fontFamily: 'Kanit'),),
        ),
      ),
    );
  }

  Widget buildUpholsteryContainer(int index, String label){
    return GestureDetector(
      onTap: (){
        setState(() {
          if(_selectedIndexesUpholstery.contains(index)){
            _selectedIndexesUpholstery.remove(index);
          }else{
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
            color: _selectedIndexesUpholstery.contains(index) ? Color(0xFF2F89C0) : Color(0xFF828282),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(label,style: TextStyle(fontSize: 17,fontFamily: 'Kanit'),),
        ),
      ),
    );
  }

}
