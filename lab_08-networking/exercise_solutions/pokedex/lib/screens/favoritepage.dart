import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pokedex/repository/favorites.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  static const route = '/favorite';
  static const routename = 'Favorite Pokemon';

  @override
  Widget build(BuildContext context) {
    print('${FavoritePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(FavoritePage.routename),
      ),
      body: Center(
        child: Consumer<Favorites>(builder: (context, favorites, child) {
          return ListView.builder(
              itemCount: favorites.favorites.length,
              itemBuilder: (context, pokemonIndex) {
                final pokemon = favorites.favorites[pokemonIndex];
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Image.network(pokemon.sprite),
                    trailing: Icon(MdiIcons.delete),
                    title: Text(pokemon.name.toUpperCase()),
                    onTap: () => favorites.removeFavorite(pokemonIndex),
                  ),
                );
              });
        }),
      ),
    );
  } //build

} //HomePage
