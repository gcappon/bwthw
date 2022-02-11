import 'package:flutter/material.dart';

class PickValuePage extends StatelessWidget {
  const PickValuePage({Key? key}) : super(key: key);

  static const route = '/pickValue/';
  static const routename = 'PickValuePage';

  @override
  Widget build(BuildContext context) {
    print('${PickValuePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(PickValuePage.routename),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('To the home with a value'),
          onPressed: () {
            //You can add an argument to Navigator.pop() to give it back to the caller
            Navigator.pop(context, 'This is the value');
          },
        ),
      ),
    );
  } //build

} //PickValuePage
