import 'package:flutter/material.dart';
import 'package:reproduce_structure/screens/calendarPage.dart';
import 'package:reproduce_structure/screens/editEventPage.dart';
import 'package:reproduce_structure/screens/editProfilePage.dart';
import 'package:reproduce_structure/screens/homePage.dart';
import 'package:reproduce_structure/screens/loginPage.dart';
import 'package:reproduce_structure/screens/profilePage.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route : (context) => LoginPage(),
        HomePage.route : (context) => HomePage(),
        ProfilePage.route : (context) => ProfilePage(),
        CalendarPage.route : (context) => CalendarPage(),
        EditEventPage.route : (context) => EditEventPage(),
        EditProfilePage.route : (context) => EditProfilePage(),
      },
    );
  } //build
}//MyApp