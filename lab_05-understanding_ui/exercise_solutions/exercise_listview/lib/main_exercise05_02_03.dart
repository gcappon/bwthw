import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
} //main

class MyApp extends StatelessWidget {


  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: const [
            Icon(
              Icons.done,
            ),
            Icon(Icons.error)
          ],
          title: const Text('The AppBar'),
        ),
        body: 
          //_exercise0502(), //Uncomment to see the solution to exercise 05.02
          _exercise0503(), //Uncomment to see the solution to exercise 05.03

        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('An option'),
              Text('Another option'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
          },
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],),
      ),
    );
  } //build

  //Returns the ListView as requested by Exercise 05.02
  Widget _exercise0502() => ListView(
          children: [
            ListTile(
              leading: Icon(Icons.info),
              title: Text('First tile'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Second tile'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Third tile'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Fourth tile'),
              trailing: Icon(Icons.arrow_right),
            ),
          ],
        );

  //Returns the ListView as requested by Exercise 05.03
  Widget _exercise0503() => ListView(
          children: [
            ListTile(
              leading: Icon(Icons.info),
              title: Text('${WordPair.random().first.toUpperCase()}'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('${WordPair.random().first.toUpperCase()}'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('${WordPair.random().first.toUpperCase()}'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('${WordPair.random().first.toUpperCase()}'),
              trailing: Icon(Icons.arrow_right),
            ),
          ],
        );
  
}//MyApp