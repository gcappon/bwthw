import 'package:flutter/material.dart';
import 'package:get_step/screens/homepage.dart';

void main() {
  runApp(MyApp());
} //main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
    );
  } //build
}//MyApp