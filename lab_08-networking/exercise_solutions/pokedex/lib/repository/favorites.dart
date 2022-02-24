import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:http/http.dart' as http;

class Favorites extends ChangeNotifier{
  List<Pokemon> favorites = [];

  Future<void> addFavorite(Pokemon toAdd) async{
    if(_alreadyIn(toAdd) == false){
      favorites.add(toAdd);
      notifyListeners();
    }//if
  }//addFavourite

  void removeFavorite(int id){
    favorites.removeAt(id);
    notifyListeners();
  }//removeFavourite

  bool _alreadyIn(Pokemon pokemon){
    for (var f in favorites) {
      if(f.id == pokemon.id){
        return true;
      }//if
    }//for
    return false;
  }//_alreadyIn

}//Favourites 