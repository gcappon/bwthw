import 'package:flutter/material.dart';
import 'package:there_and_back_again/screens/homePage.dart';
import 'package:there_and_back_again/screens/messagePage.dart';
import 'package:there_and_back_again/screens/pickValuePage.dart';
import 'package:there_and_back_again/screens/profilePage.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //This specifies the app entrypoint
      initialRoute: '/',
      //This maps names to the set of routes within the app
      routes: {
        '/' : (context) => HomePage(),
        '/profile/': (context) => ProfilePage(), 
        '/message/': (context) => MessagePage(),
        '/pickValue/': (context) => PickValuePage(),
      },
    );
  } //build
}//MyApp