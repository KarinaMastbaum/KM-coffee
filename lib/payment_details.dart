import 'package:coffe_app/coffee.dart';
import 'package:coffe_app/payment.dart';
import 'package:flutter/material.dart';

class PaymentDetails extends StatefulWidget {

  const PaymentDetails({
    Key key,
    this.coffee
  });

  final Coffee coffee;

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart'),
        backgroundColor: Colors.brown[200],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 50, right: 10, bottom: 200),
            height: 130.0,
            width: 500.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), 
                ),
              ],
            ),
            child:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'coffee',
                      child: Image.asset(
                        '${widget.coffee.image}',
                        fit: BoxFit.fill,
                        width: 50,
                      ),
                    ),
                    SizedBox(width: 30.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                             '${widget.coffee.name}',
                             style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                            maxLines: 2,   
                            ),
                            SizedBox(height: 10),
                          Text(
                            "\$${widget.coffee.price.toStringAsFixed(2)}",
                            style: TextStyle(fontWeight: FontWeight.normal,
                              color: Colors.black, fontSize: 18),
                              textAlign: TextAlign.left
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(onTap:(){},
                      child:Container(padding:EdgeInsets.all(5),child: Icon(Icons.delete, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
          ),
            SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Total:',
                    style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.black, fontSize: 25),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 5.0),
                  Text('\$${widget.coffee.price.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.normal,
                      color: Colors.black, fontSize: 25),
                    textAlign: TextAlign.left,
                  ),  
                ],
              ),
            ),
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Checkout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Payment())
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
        ],
      ),
    );
  }
}
