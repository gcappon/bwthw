import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
} //main

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
} //MyApp

class _MyAppState extends State<MyApp> {
  //This list maintains the state of MyApp as requested
  List<Widget> items = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dynamic ListView'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              items.add(
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('${WordPair.random().first.toUpperCase()}'),
                  trailing: Icon(Icons.arrow_right),
                ),
              );
            });
          },
        ),
      ),
    );
  } //build
}//_MyAppState