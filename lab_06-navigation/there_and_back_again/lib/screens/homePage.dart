import 'package:flutter/material.dart';
import 'package:there_and_back_again/screens/profilePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/';
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
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage())); //Uncomment to see the "unnamed" approach
                Navigator.pushNamed(context, '/profile/'); //uncomment to see the "named" approach
              },
            ),
            ElevatedButton(
              child: Text('To the message'),
              onPressed: () {
                Navigator.pushNamed(context, '/message/', arguments: {'message': 'Hello!'}); 
              },
            ),
            ElevatedButton(
              child: Text('Pick a value'),
              onPressed: () async {
                //Get the result
                final result = await Navigator.pushNamed(context, '/pickValue/'); 
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
