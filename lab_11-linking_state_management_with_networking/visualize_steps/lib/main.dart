import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visualize_steps/providers/data_provider.dart';
import 'package:visualize_steps/screens/homepage.dart';

void main() {
  runApp(MyApp());
} //main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => DataProvider(),
          child: HomePage()),
    );
  } //build
}//MyApp