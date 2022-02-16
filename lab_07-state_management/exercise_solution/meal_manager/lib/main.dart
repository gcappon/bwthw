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
        initialRoute: HomePage.route,
        //Here, I'm demonstrating another way to manage Navigation. This approach can be handy when you need to
        //pass data to a route directly to its constructor and you want to continue to use pushNamed().
        onGenerateRoute: (settings) {
          if (settings.name == HomePage.route) {
            return MaterialPageRoute(builder: (context) {
              return HomePage();
            });
          } else if (settings.name == MealPage.route) {
            final args = settings.arguments as Map;
            return MaterialPageRoute(builder: (context) {
              return MealPage(
                  mealIndex: args['mealIndex'], mealDB: args['mealDB']);
            });
          } else {
            return null;
          } //if-else
        },//onGenerateRoute
      ),
    );
  } //build
} //MyApp
