import 'package:coffe_app/coffee_concept_home.dart';
import 'package:flutter/material.dart';

class OrderConfirment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmed order'),
        centerTitle: true,
        backgroundColor: Colors.brown[200],
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/car-way.png'),
                  )
                ),
              ),
              SizedBox(height: 20),
              Text('Your order is on the way!',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.brown),
              textAlign: TextAlign.justify,),
              SizedBox(height: 100.0,),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('Home', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoffeeConceptHome())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown[200],
                      onPrimary: Colors.white,
                      shadowColor: Colors.brown,
                      elevation: 5,
                    ),
                  ),
                ),
              ),
            ),
            ] ,
          ),
        ),
    );
  }
}