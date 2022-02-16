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
        //TODO: comment the approach you do not wnat to use.

        //Approach 1: Unnamed routes
        home: <insert_the_homepage_widget_here>,

        //Approach 2:
        //This specifies the app entrypoint
        initialRoute: <insert_the_initial_routename_here>,
        //This maps names to the set of routes within the app
        routes: {
          <insert_the_initial_routename_here>: (context) => <insert_the_homepage_widget_here>,
        },
    );
  } //build
}//MyApp