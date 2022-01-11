import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
} //main

class MyApp extends StatefulWidget {


  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}//MyApp

class _MyAppState extends State<MyApp> {

  //This list maintains the state of MyApp as requested
  List<Widget> _listTiles = [];

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
          _exercise050405(),
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
            _addTile();
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

  //Returns the ListView as requested by exercise 05.04 and 05.05
  Widget _exercise050405() => ListView.builder(itemBuilder: (_,i) => _listTiles[i], itemCount: _listTiles.length,);

  //Method that adds a ListTile to the current _listTiles after the FAB is tapped using setState((){})
  void _addTile(){  
    setState(() {
    _listTiles.add(
      ListTile(
              leading: Icon(Icons.info),
              title: Text('${WordPair.random().first.toUpperCase()}'),
              trailing: Icon(Icons.arrow_right),
            ),
      );
    });
  }//_addTile

}//_MyAppState