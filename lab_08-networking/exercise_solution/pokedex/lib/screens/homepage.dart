import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

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
          future: _fetchPokemon(1),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final pokemon = snapshot.data as Pokemon;
              return Text('${pokemon.name}');
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  } //build

  Future<Pokemon> _fetchPokemon(int id) async {
    String baseURL = 'https://pokeapi.co/api/v2/';
    String endpoint = 'pokemon/$id/';
    final url = baseURL + endpoint;
    final response = await http.get(Uri.parse(url));
    return Pokemon.fromJson(jsonDecode(response.body));
  }//_fetchBulbasaur

} //HomePage
