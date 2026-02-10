import 'package:flutter/material.dart';
import 'package:there_and_back_again/screens/messagePage.dart';
import 'package:there_and_back_again/screens/pickValuePage.dart';
import 'package:there_and_back_again/screens/profilePage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const routename = 'Homepage';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('To the profile'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),

            ElevatedButton(
              child: Text('To the message'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage(message: 'Hello!',)));
              },
            ),
            ElevatedButton(
              child: Text('Pick a value'),
              onPressed: () async {
                //Get the result
                final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => PickValuePage()));
                // After the Selection Screen returns a result, hide any previous snackbars
                // and show the new result.
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text('$result')));

              },
            ),
          ],
        ),
      ),
    );
  } //build

} //HomePage
