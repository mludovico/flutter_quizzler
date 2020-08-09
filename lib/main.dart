import 'package:flutter/material.dart';
import 'package:quizzler/home_screen.dart';

void main() {
  runApp(QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

}