import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}//main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
      appBar: AppBar(title: Text('Welcome to Flutter'),),
      body: Center(
        child: RandomHello(),
      ),),
    );
  }//build
}//MyApp


class RandomHello extends StatefulWidget{
  RandomHello({Key? key}) : super(key: key);
  
  @override
  _RandomHelloState createState() => _RandomHelloState();
}//RandomHello

class _RandomHelloState extends State<RandomHello>{

  String? _word;

  @override
  void initState() {
    _word = WordPair.random().first;
    super.initState();
  }//initState

  @override
  Widget build(BuildContext buildContext){
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, $_word!'),
            ElevatedButton(onPressed: _changeWord, child: Text('Press me')),
          ],
        );
  }//build 

  //Private method to set a new _word
  void _changeWord(){
    setState(() {
      _word = WordPair.random().first;
    });
  }//_changeWord
  
}//_RandomHelloState




/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final word = WordPair.random().first;
    print(word);
    
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
      appBar: AppBar(title: const Text('Welcome to Flutter'),),
      body: const Center(
        child: RandomHello(),
      ),),
    );
  }//build
}//MyApp


class RandomHello extends StatefulWidget{
  const RandomHello({Key? key}) : super(key: key);

  @override
  _RandomHelloState createState() => _RandomHelloState();
}//RandomHello

class _RandomHelloState extends State<RandomHello>{

  @override
  Widget build(BuildContext buildContext){
    final word = WordPair.random().first;
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, $word!'),
            ElevatedButton(onPressed: (){}, child: const Text('Press me')),
          ],
        );
  }//build 
  
}//_RandomHelloState
*/