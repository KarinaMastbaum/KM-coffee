import 'package:flutter/material.dart';

import 'package:coffe_app/coffee.dart';
import 'package:coffe_app/coffee_concept_details.dart';



const _duration = Duration(milliseconds: 300);

const _initialPage = 8.0;

class CoffeeConceptList extends StatefulWidget {

  @override
  _CoffeeConceptListState createState() => _CoffeeConceptListState();
}

class _CoffeeConceptListState extends State<CoffeeConceptList> {

  final _pagecoffeController = PageController(
    viewportFraction: 0.35, 
    initialPage: _initialPage.toInt(),
  );

  final _pageTextController = PageController(initialPage: _initialPage.toInt());

  double _currentPage = _initialPage;
  double _textPage = _initialPage;

  void _coffeScrollListener(){
    setState(() {
      _currentPage = _pagecoffeController.page;
    });
  }

  void _textScrollListener() {
    setState(() {
      _textPage = _currentPage;
    });
  }

  @override
  void initState() {
    _pagecoffeController.addListener(_coffeScrollListener);
    _pageTextController.addListener(_textScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pagecoffeController.removeListener(_coffeScrollListener);
    _pageTextController.removeListener(_textScrollListener);
    _pagecoffeController.dispose();
    _pageTextController.dispose();
    super.dispose();
  }


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
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined,
            color: Colors.black),
            onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            bottom: -size.height*0.22,
            height: size.height*0.3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown[400],
                    blurRadius: 95,
                    offset: Offset.zero,
                    spreadRadius: 50, 
                  )
                ]),
            )
          ),
          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              controller: _pagecoffeController, 
              scrollDirection: Axis.vertical,
              itemCount: coffees.length + 1,
              onPageChanged: (value) {
                if(value < coffees.length){
                  _pageTextController.animateToPage(
                    value, 
                    duration:_duration, 
                    curve: Curves.easeOut
                  );
                } 
              },
              itemBuilder: (context, index) {
                if(index == 0) {
                  return const SizedBox.shrink(); 
                }
                final coffee = coffees[index - 1];
                final result = _currentPage - index + 1;
                final value = -0.4 * result + 1;
                final opacity = value.clamp(0.0, 1.0);



            return GestureDetector(
              onTap: () {
                 Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration:  _duration,
                  pageBuilder: (context, animation, _){
                    return FadeTransition(
                      opacity: animation,
                      child: CoffeeConceptDetails(coffee: coffee),
                    );
                  }),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
              child: Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(
                  0.0,
                  MediaQuery.of(context).size.height/2.6 * (1 - value).abs())
                ..scale(value),
                child: Opacity(opacity: opacity,
                child: Hero(
                  tag: coffee.name,
                  child: Image.asset(
                    coffee.image,
                    fit: BoxFit.fitHeight,
                )
                )),
              ),
              ),
            );
          }),
          ),
           Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 100,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 1.0, end: 0.0),
              builder: (context, value, child){
                return Transform.translate(
                  offset: Offset(0.0, -100 * value),
                  child: child,
                );
              },
              duration: const Duration(milliseconds: 500),  
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: coffees.length,
                    controller: _pageTextController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      final opacity = (1 - (index - _textPage).abs()).clamp(0.0, 1.0);
                      return Opacity(
                        opacity: opacity,
                        child: Padding(
                          padding: EdgeInsets.symmetric( horizontal: size.width*0.2),
                          child: Hero( 
                            tag: 'text_${coffees[index].name}',
                            child: Material(
                              child: Text(
                                coffees[index].name,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                ),
                const SizedBox(height: 15),
                AnimatedSwitcher(
                  duration: _duration,
                  child: Text(
                  '\$${coffees[_currentPage.toInt()].price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  key: Key(coffees[_currentPage.toInt()].name),
                  ),
                ),
              ],
            ),
          ),
          ),
        ],
      )
    ); 
  }
}

