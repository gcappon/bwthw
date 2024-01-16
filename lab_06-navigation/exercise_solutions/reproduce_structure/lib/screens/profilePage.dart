import 'package:flutter/material.dart';
import 'package:reproduce_structure/screens/editProfilePage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routename = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    print('${ProfilePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(ProfilePage.routename),
        actions: [
          IconButton(onPressed: () => _toEditProfilePage(context), icon: Icon(Icons.edit))
        ],
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
          ],
        ),
      ),
    );
  } //build

  void _toEditProfilePage(BuildContext context){
    //Push the EditProfilePage
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
  }//_toEditProfilePage

} //ProfilePage
