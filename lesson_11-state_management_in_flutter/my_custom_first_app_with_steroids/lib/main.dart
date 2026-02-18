import 'package:flutter/material.dart';
import 'package:my_custom_first_app_with_steroids/screens/homePage.dart';

void main() {
  runApp(MyApp());
}//main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: HomePage(),
    );
  }}//MyApp
