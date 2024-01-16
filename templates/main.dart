import 'package:flutter/material.dart';
//TODO: import the homepage widget

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: <insert_the_homepage_widget_here>,
    );
  } //build
}//MyApp