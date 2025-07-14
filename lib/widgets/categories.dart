// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
class CategoriesSelector extends StatefulWidget {
  const CategoriesSelector({super.key});

  @override
  _CategoriesSelectorState createState() => _CategoriesSelectorState();
}

class _CategoriesSelectorState extends State<CategoriesSelector> {
  int selectedIndex=0;
  final List<String> categories=['Messages','Online','Groups','Requests'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.0,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        return Padding(padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex=index;
            });
          },
          child: Text(categories[index],
            style: TextStyle(fontSize: 28.0,
                letterSpacing: 1,
                color: index==selectedIndex? const Color(0x55cfd8dc):Colors.white,fontWeight: FontWeight.bold),),
        ),);
      },),
    );
  }
}
