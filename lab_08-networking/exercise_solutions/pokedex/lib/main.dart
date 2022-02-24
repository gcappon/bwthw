import 'package:flutter/material.dart';
import 'package:pokedex/repository/favorites.dart';
import 'package:pokedex/screens/favoritepage.dart';
import 'package:pokedex/screens/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
} //main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //The app has two pages: the HomePage and the FavoritePage.
    //State of the app is managed using Provider. We are injecting a Favorites instance.
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        //This specifies the app entrypoint.
        initialRoute: HomePage.route,
        //This maps names to the set of routes within the app.
        routes: {
          HomePage.route: (context) => HomePage(),
          FavoritePage.route: (context) => FavoritePage(),
        },
    ),);
  } //build
}//MyApp