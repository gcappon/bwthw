import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);
  
  static const route = '/message/';
  static const routename = 'MessagePage';

  @override
  Widget build(BuildContext context) {
    
    print('${MessagePage.routename} built');

    //Get the value provided by the HomePage
    final message = ModalRoute.of(context)!.settings.arguments! as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(MessagePage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the message: $message'),
            ElevatedButton(
              child: Text('To the home'),
              onPressed: () {
                //This allows to get back to the HomePage
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  } //build

} //MessagePage
