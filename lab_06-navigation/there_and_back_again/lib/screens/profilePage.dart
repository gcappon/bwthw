import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    print('${ProfilePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(ProfilePage.routename),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('To the home'),
          onPressed: () {
            //This allows to go back to the HomePage
            Navigator.pop(context);
          },
        ),
      ),
    );
  } //build

} //ProfilePage
