import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('DEI - UNIPD'), backgroundColor: Colors.red),
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          backgroundColor: Colors.red,
          child: Icon(Icons.favorite_border, ),
          onPressed: (){},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('via G. Gradenigo 6/B, 35131', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text('Padova (PD), Italy', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.grey),)
                      
                    ],
                  ),
                  SizedBox(width: 20,),
                  Icon(Icons.favorite),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.call),
                      Text('CALL'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.directions),
                      Text('DIRECTIONS'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.share),
                      Text('SHARE'),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 50),
                child: Text("The Department's teaching and research activities primarily concern the area of Information Engineering, which includes the following disciplines: applied optics, bioengineering, computer science, electronics, operational research, systems and control theory, and telecommunications. The Department coordinates 9 first- and second-level degree programmes and a doctoral school, providing students with 15 laboratories (hosting over 150 workstations), free WiFi access, and an open-shelf library. Faculty (about 100) and research personnel (about 150, comprising graduate students, post-doctoral fellows and research associates) work in about 50 research groups and 45 research laboratories, with an impressive record of publications and collaborations with research institutions and companies worldwide. The Department's faculty comprises 6 IEEE Fellows."),
              )
            ],
          ),
        ),
      ),
    );
  }
}