import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
        body: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('ListTile 1 title'),
              subtitle: Text('ListTile 1 subtitle'),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('ListTile 2 title'),
              subtitle: Text('ListTile 2 subtitle'),
              trailing: Icon(Icons.arrow_right),
            ),
          ],
        ),
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
          onPressed: () {},
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
}//MyApp