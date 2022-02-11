import 'package:flutter/material.dart';
import 'package:reproduce_structure/screens/editEventPage.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  static const route = '/calendar/';
  static const routename = 'CalendarPage';

  @override
  Widget build(BuildContext context) {
    print('${CalendarPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(CalendarPage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('To the HomePage'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text('To the EditEventPage'),
              onPressed: () {
                _toEditEventPage(context);
              },
            ),
          ],
        ),
      ),
    );
  } //build

  void _toEditEventPage(BuildContext context){
    //Push the EditEventPage
    Navigator.pushNamed(context, EditEventPage.route);
  }//_toEditEventPage

} //CalendarPage
