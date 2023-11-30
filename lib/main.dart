import 'package:bmi_calcultor/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyBmiCalculator());
}

class MyBmiCalculator extends StatelessWidget {
   MyBmiCalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: BmiCalculator(),
    );
  }
}




