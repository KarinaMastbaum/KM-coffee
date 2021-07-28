import 'package:flutter/material.dart';
import 'package:coffe_app/coffee_concept_home.dart';

class MainCoffeeApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(), 
      child: CoffeeConceptHome(),
    );
  }
}
