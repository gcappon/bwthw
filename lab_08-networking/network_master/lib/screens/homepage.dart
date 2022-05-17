import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:network_master/models/post.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'HomePage';

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
              future: _fetchPost(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final post = snapshot.data as Post;
                  return Text('FETCHED POST: ${post.title}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            SizedBox(height: 100,),
            ElevatedButton(
                onPressed: () async {
                  await _createPost();
                },
                child: Text('Create a new post'))
          ],
        ),
      ),
    );
  } //build

  //This method allows to fetch a post using the RESTful APIs
  Future<Post?> _fetchPost(int id) async {
    final url = 'https://jsonplaceholder.typicode.com/posts/$id';
    final response = await http.get(Uri.parse(url));
    print(response.body);
    return response.statusCode == 200 ? Post.fromJson(jsonDecode(response.body)): null;
  } //_fetchPost

  //This method allows to create a new post and send it to the RESTful API
  Future<Post?> _createPost() async {
    final url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'userId': 1,
          'title': 'test',
          'body': 'This is a test post',
        }));
    print(response.body);
    return response.statusCode == 200 ? Post.fromJson(jsonDecode(response.body)) : null;
  } //_createPost

} //HomePage
