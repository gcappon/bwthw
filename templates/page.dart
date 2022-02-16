import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Page extends StatelessWidget {
  Page({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'Page';
  
  @override
  Widget build(BuildContext context) {
    print('${Page.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(Page.routename),
      ),
      body: Center(
        child: Text('Hello, world!'),
      ),
    );
  } //build

} //HomePage
