import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? _word;

  @override
  void initState() {
    _word = WordPair.random().first;
    super.initState();
  }//initState

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: AppBar(title: Text('Welcome to Flutter'),),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Hello $_word!', style: TextStyle(fontSize: 26)),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _word = WordPair.random().first;
                  });
                },
                child: Text('Press me'),
              ),
            ],
          ),
        ),
    );
  }}//HomePage
