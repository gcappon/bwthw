import 'package:flutter/material.dart';
import 'package:reproduce_structure/screens/homePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routename = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    print('${LoginPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(LoginPage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('To the HomePage'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePage())));
              },
            ),
          ],
        ),
      ),
    );
  } //build

} //LoginPage
