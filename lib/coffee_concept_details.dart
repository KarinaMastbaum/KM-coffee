import 'package:coffe_app/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:coffe_app/coffee.dart';


class CoffeeConceptDetails extends StatefulWidget {
  
  
  const CoffeeConceptDetails ({Key key, this.coffee}) : super(key: key);

  final Coffee coffee;

  @override
  _CoffeeConceptDetailsState createState() => _CoffeeConceptDetailsState();
}

class _CoffeeConceptDetailsState extends State<CoffeeConceptDetails> {

  int currentSelectedIndex = 1;

  List<String> image = ["assets/taza_s.png", "assets/taza_m.png", "assets/taza_l.png"];
  List<String> text = ["small", "Medium", "Large"];

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.2),
            child: Hero(
              tag: '_text${widget.coffee.name}',
              child: Material(
                child: Text(
                  widget.coffee.name, 
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: size.height * 0.4,
            child: Stack (
              children: [
                Positioned.fill(
                  child: Hero (
                    tag: widget.coffee.image,
                    child: Image.asset(
                      widget.coffee.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * 0.05,
                  bottom: -1,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child){
                      return Transform.translate(
                        offset: Offset(100 * value, 150 * value),
                        child: child,
                      );
                    },
                    duration: const Duration(milliseconds: 500),
                    child: Text('\$${widget.coffee.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.brown,
                            blurRadius: 20,
                            spreadRadius: 30,
                          )
                        ]
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
          Container(
            height: 200,
            width: 350,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CoffeButton(
                        index: index,
                        isSelected: currentSelectedIndex == index,
                        onSelect: () {
                          setState(() {
                            print("on selected");
                            currentSelectedIndex = index;
                          });
                        },
                        image: image[index],
                        text: text[index],
                      ),
                    );
                  },
                ),
              ),
          ),
          Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Buy Now'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentDetails(coffee: widget.coffee))
                    );                  },
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

class CoffeButton extends StatelessWidget {
  CoffeButton({
    this.index,
    this.isSelected,
    this.onSelect,
    this.image,
    this.text,
  });
  int index;
  bool isSelected;
  VoidCallback onSelect;
  String image;
  String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            child: CircleAvatar(
              child: Transform.translate(child: Image.asset(image),
              offset: Offset(-1.0, -14.0)),
              backgroundColor: isSelected ? Colors.brown : Colors.brown[200],
              radius: 40,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}