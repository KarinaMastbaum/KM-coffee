import 'package:coffe_app/order_confirment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class Payment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Payment'),
        backgroundColor: Colors.brown[200],
      ),
      body: Column(
        children: [
          CreditCardSelect(),
          SizedBox(height: 40.0),
          InputField(),
          SizedBox(height: 50.0),
          PayButton(),
        ],
      ),
    );
  }
}

class CreditCardSelect extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      final List imgList = [
      'assets/credit-card-master.png',
      'assets/credit-card-visa.png',
      'assets/credit-card-amex.png',
    ];

    final size = MediaQuery.of(context).size;

    return Container(
       width: double.infinity,
       height: size.height * 0.3,
       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Swiper(
           itemCount: imgList.length,
           layout: SwiperLayout.STACK,
           itemHeight: size.height * 0.9,
           itemWidth: size.width * 0.8,
           itemBuilder: (_, int index){
             return 
               new Image.asset(imgList[index],
                 fit: BoxFit.contain,
             );  
           },
         ),
       ),
    );
  }
}

class InputField extends StatefulWidget {

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          TextField(
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
            ),
            labelText: 'Name',
            helperText: 'Name on card',
        ),
        onChanged: (valor) {                      
          setState(() {});
        },
      ),
      SizedBox(height: 20.0),
      TextField(
            decoration: InputDecoration(
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
            ),
            labelText: "Card Number"),
            keyboardType: TextInputType.number,
          ),
      SizedBox(height: 20.0),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: SizedBox(
                  width: 160,
                  child: TextField(
                  obscureText: true,
                  // maxLength: 3,    // Se utiliza para poner la contraseña
                    textCapitalization: TextCapitalization.sentences,     
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        hintText: '000',
                        labelText: 'CVV',
                        suffixIcon: Icon( Icons.lock_open ),
                      ),
                      onChanged: (valor) {                       // onChanged: para que queden registrados los datos que se ingresan
                        setState(() {});
                      },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.0, left: 30.0),
                 child: SizedBox(
                  width: 160,
                  child: TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                  ),
                  labelText: "Expiry date"),
                  keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ), 
        ], 
      ),
    );
  }
}

class PayButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Pay', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderConfirment())
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
          );
  }
}