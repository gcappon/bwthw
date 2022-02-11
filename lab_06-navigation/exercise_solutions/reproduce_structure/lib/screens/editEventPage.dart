import 'package:flutter/material.dart';

class EditEventPage extends StatelessWidget {
  const EditEventPage({Key? key}) : super(key: key);

  static const route = '/calendar/edit_event/';
  static const routename = 'EditEventPage';

  @override
  Widget build(BuildContext context) {
    print('${EditEventPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(EditEventPage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('To the CalendarPage'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  } //build

} //EditEventPage
