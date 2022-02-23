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
        child: FutureBuilder(
          future: _fetchPost(1),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final post = snapshot.data as Post;
               
              return Text('${post.title}');
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  } //build

  Future<Post> _fetchPost(int id) async {
    final url = 'https://jsonplaceholder.typicode.com/posts/$id';
    final response = await http.get(Uri.parse(url));
    print(response.body);
    return Post.fromJson(jsonDecode(response.body));
  }//_fetchPost
  

} //HomePage
