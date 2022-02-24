import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repository/favorites.dart';
import 'package:pokedex/screens/favoritepage.dart';
import 'package:pokedex/widgets/formTiles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'Pokedex';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Form globalkey: this is required to validate the form fields.
  final formKey = GlobalKey<FormState>();

  //Variables that maintain form field value in memory
  TextEditingController _pokeController = TextEditingController();
  //Variable that stores the value of the currently selected pokemon
  Pokemon? _selectedPokemon;

  //This initializes the textbox and the current selected pokemon.
  @override
  void initState() {
    _pokeController.text = '';
    _selectedPokemon = null;
    super.initState();
  } // initState

  //Remember that form controllers need to be manually disposed. So, here we need also to override the dispose() method.
  @override
  void dispose() {
    _pokeController.dispose();
    super.dispose();
  } // dispose

  @override
  Widget build(BuildContext context) {

    //This is for debug.
    print('${HomePage.routename} built');

    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routename),
        actions: [
          //This action is used to navigate to the Favorite Page.
          IconButton(onPressed: () => _toFavoritePage(context), icon: Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          //This build the form which is composed of the textbox and the search button
          _buildForm(context),
          //Let's add 100 px of space
          SizedBox(
            height: 100,
          ),
          //A Card is used to dispaly yhe result of the API call.
          Center(
            child: _selectedPokemon == null
                ? Text('Search for a Pokemon')
                : _buildPokemonCard(context),
          ),
        ],
      ),
      
    );
  } //build

  //This utility method is used to build the Form
  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 8, left: 20, right: 20),
            child: FormNumberTile(
              labelText: 'Pokemon #',
              controller: _pokeController,
              icon: MdiIcons.pokeball,
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () => _validateAndSearch(context),
            child: Text('Search')),
      ],
    );
  } // _buildForm

  //This utility method is used to build the Card showing the results of the API call
  Widget _buildPokemonCard(BuildContext context) {
    return Container(
      width: 250,
      height: 270,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                '${_selectedPokemon!.name}'.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Image.network(_selectedPokemon!.sprite),
              Text(
                '#' + '${_selectedPokemon!.id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Weight: ' +
                  '${_selectedPokemon!.weight / 10}'.toUpperCase() +
                  ' kg'),
              Text('Height: ' +
                  '${_selectedPokemon!.height / 10}'.toUpperCase() +
                  ' m'),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () =>
                      Provider.of<Favorites>(context, listen: false)
                          .addFavorite(_selectedPokemon!),
                  child: Icon(Icons.favorite),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),

                  ),
                ),
            ],
          ),
        ),
      ),
    );
  } //_buildPokemonCard

  //This utility method is used to fetch the Pokemon data using the PokeAPI
  Future<void> _fetchPokemon(int id) async {
    String baseURL = 'https://pokeapi.co/api/v2/';
    String endpoint = 'pokemon/$id/';
    final url = baseURL + endpoint;
    final response = await http.get(Uri.parse(url));
    setState(() {
      response.statusCode == 200
          ? _selectedPokemon = Pokemon.fromJson(jsonDecode(response.body))
          : _selectedPokemon = null;
    });
  } //_fecthPokemon

  //Utility method that validate the form and, if it is valid, tries to fetch the pokemon data.
  void _validateAndSearch(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await _fetchPokemon(int.parse(_pokeController.text));
    } //if
  } // _validateAndSearch

  //Utility ethod to navigate to the Favorite page
  void _toFavoritePage(BuildContext context){
    Navigator.pushNamed(context, FavoritePage.route);
  }//_toFavoritePage
} //HomePage
