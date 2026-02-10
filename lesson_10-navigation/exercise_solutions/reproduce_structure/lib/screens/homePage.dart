import 'package:flutter/material.dart';
import 'package:reproduce_structure/screens/calendarPage.dart';
import 'package:reproduce_structure/screens/profilePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routename = 'Homepage';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routename),
      ),
      body: Center(
          child: Text('reproduce_layout'),
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('reproduce_layout'),
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('To ProfilePage'),
              onTap: () => _toProfilePage(context),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('To CalendarPage'),
              onTap: () => _toCalendarPage(context),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => _toLoginPage(context),
            ),
          ],
        ),
      ),
    );
  } //build

  void _toProfilePage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then push the ProfilePage
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
  }//_toProfilePage

  void _toCalendarPage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then push the CalendarPage
    Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarPage()));
  }//_toCalendarPage

  void _toLoginPage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.pop(context);
  }//_toCalendarPage

} //HomePage
