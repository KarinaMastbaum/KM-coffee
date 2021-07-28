import 'package:coffe_app/main_coffee_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffe app',
      home: MainCoffeeApp(),
    );
  }
}



// class MyApp extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData.light(), 
//       child: CoffeeConceptList(),
//     );
//   }
// }
