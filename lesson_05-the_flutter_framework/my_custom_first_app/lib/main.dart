import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}//main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final word = WordPair.random().first;

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
      appBar: AppBar(title: Text('Welcome to Flutter'),),
      body: Center(child: Text('Hello $word!', style: TextStyle(fontSize: 26) ,),),),
    );
  }//build
}//MyApp
