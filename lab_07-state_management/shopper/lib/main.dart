import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/models/cart.dart';
import 'package:shopper/screens/homepage.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Here we are injecting an instance of Cart through the widget tree. As such, the instance will be shared through the application.
    //Moreover, everyone will be able to perform action over this instance. 
    return ChangeNotifierProvider<Cart>(
      create: (context) => Cart(),
      child: MaterialApp(
        //This specifies the app entrypoint
        home: HomePage(),
      ),
    );
  } //build
}//MyApp