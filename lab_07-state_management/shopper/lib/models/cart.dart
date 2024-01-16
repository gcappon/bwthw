
import 'package:flutter/material.dart';

//THis class extends ChangeNotifier. It will act as data repository to be shared thorugh the application.
class Cart extends ChangeNotifier{

  //For simplicity, a product is just a String.
  List<String> products = [];

  void addProduct(String toAdd){
    products.add(toAdd);
    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }//addProduct

  void clearCart(){
    products.clear();
    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }//clearCart
  
}//Cart