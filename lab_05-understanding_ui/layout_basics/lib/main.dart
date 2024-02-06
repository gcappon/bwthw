import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}//main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: 
        _example1(),
        //_example2(),
        //_example3(),
        //_example6(),
        //_example7(),
        //_example14(),
        //_example18(),
        //_example19(),
    );
  }//build

  Widget _example1() => Container(color: Colors.red,);

  Widget _example2() => Container(color: Colors.red, width: 100, height: 100,);

  Widget _example3() => Center(child: Container(color: Colors.red,width: 100, height: 100,),);
  
  Widget _example6() => Center(child: Container(color: Colors.red,),);

  Widget _example7() => Center(child: Container(color: Colors.red, child: Container(color: Colors.green, width: 30,height: 30,),),);

  Widget _example14() => UnconstrainedBox(child: Container(color: Colors.red, width: 4000, height: 50,),);

  Widget _example18() => FittedBox(child: Text('Some Example Text.', style: TextStyle(fontSize: 16)),);

  Widget _example19() => Center(child: FittedBox(child: Text('Some Example Text', style: TextStyle(fontSize: 16),),),);

}//MyApp
