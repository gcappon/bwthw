import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //This state (ephemeral) variable allows to store the value of count.
  int count = 0;

  @override
  initState() {
    super.initState();

    //Here we initialize the value of count using an utility method. 
    //Note that we need to do that since we cannot use await inside initState(): we are overriding
    //a method, modifying its signature would mean that we are defining a new method.
    _initCount();
  }//initState

  //This utility method allows to initialize the value of count when the home page is rendered the first time
  void _initCount() async{
    //Get the instance of SharedPreferences
    final sp = await SharedPreferences.getInstance();
    //Use setState to properly initialize the value of count. 
    setState(() {
      sp.getInt('count') == null ? count = 0 : count = sp.getInt('count')!;
    });
  }//_initCount 

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
            Text('Count = $count', style: TextStyle(fontSize: 25),),
            ElevatedButton(onPressed: () => _addOne(), child: Text('Press to increment the counter')),
            ElevatedButton(onPressed: () => _removeCount(), child: Text('Press to remove count from SharedPreferences'))
          ],
        ),
      ),
    );
  }//build

  //This utility method allows to increment by 1 the value of count, and stores the new 'count' key-value into SharedPreferences
  void _addOne() async{
    final sp = await SharedPreferences.getInstance();
    setState(() {
      count++;
      sp.setInt('count', count);
    });
  }//_addOne

  //This utility method allows to remove from the SharedPreferences the 'count' key-value pair.
  void _removeCount() async{
    final sp = await SharedPreferences.getInstance();
    sp.remove('count');
  }//_removeCount

} //HomePage
