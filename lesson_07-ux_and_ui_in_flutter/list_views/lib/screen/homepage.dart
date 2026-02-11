import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.done), Icon(Icons.error)],
        title: Text('The AppBar'),
      ),
      body: Center(
        child: ListView(
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
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('An option'), Text('Another option')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
