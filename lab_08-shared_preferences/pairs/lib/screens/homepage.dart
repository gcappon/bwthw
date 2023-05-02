import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
            FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: ((context, snapshot) {
                if(snapshot.hasData){
                  final sp = snapshot.data as SharedPreferences;
                  if(sp.getInt('count') == null){
                    sp.setInt('count', 0);
                    return Text('Count = 0', style: TextStyle(fontSize: 25),);
                  }
                  else{
                    final count = sp.getInt('count')!;
                    return Text('Count = $count', style: TextStyle(fontSize: 25),);
                  }
                }
                else{
                  return CircularProgressIndicator();
                }
              }),
            ),
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
      var count = sp.getInt('count');
      if(count != null){
        count++;
        sp.setInt('count', count);
      }
      
    });
  }//_addOne

  //This utility method allows to remove from the SharedPreferences the 'count' key-value pair.
  void _removeCount() async{
    final sp = await SharedPreferences.getInstance();
    sp.remove('count');
    setState(() {
      
    });
  }//_removeCount

} //HomePage
