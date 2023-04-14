import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meal_manager/models/mealDB.dart';
import 'package:meal_manager/screens/mealpage.dart';
import 'package:meal_manager/screens/homepage.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Here we are injecting an instance of the MealDB thorugh the widget tree
    return ChangeNotifierProvider<MealDB>(
      create: (context) => MealDB(),
      child: MaterialApp(
        //This specifies the entrypoint
        home: HomePage(),
      ),
    );
  } //build
} //MyApp
