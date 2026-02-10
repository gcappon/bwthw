import 'package:flutter/material.dart';
import 'package:there_and_back_again/screens/homePage.dart';

void main() {
  runApp(MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //This specifies the app entrypoint
      home: HomePage(),
    );
  } //build
}//MyApp