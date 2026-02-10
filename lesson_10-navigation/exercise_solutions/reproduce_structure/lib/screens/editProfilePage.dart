import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  static const routename = 'EditProfilePage';

  @override
  Widget build(BuildContext context) {
    print('${EditProfilePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(EditProfilePage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('To the ProfilePage'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  } //build

} //EditProfilePage
