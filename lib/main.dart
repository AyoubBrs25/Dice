import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
   const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double scrwidth = 0;
  double scrheight = 0;
  int nume = 1;
  double x = 0;
  double y = 0;
  double t = 3;



  @override
  Widget build(BuildContext context) {
    scrwidth = MediaQuery.of(context).size.width;
    scrheight = MediaQuery.of(context).size.height;
    return Container(
      height: scrheight,
      width: scrwidth,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        transform: Matrix4.translationValues(x, y, 0),
        child: Center(
          child: TextButton(
            child: AnimatedRotation(
              duration: Duration(milliseconds: 250),
              turns: t,
              child: Container(
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage('images/dice$nume.png'),
                ),
              ),
            ),
            onPressed: () {
              x = (Random().nextDouble() - 0.5) * 2 * (scrwidth - 100) / 2;
              y = (Random().nextDouble() - 0.5) * 2 * (scrheight - 100) / 2;
              Future.delayed(Duration(milliseconds: 1000),(){
                setState(() {
                  nume = Random().nextInt(5) + 1;
                  t = (Random().nextDouble() * 5) + 10;
                });
              }
              );
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}
