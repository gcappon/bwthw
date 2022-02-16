import 'package:flutter/material.dart';
import 'package:meal_manager/models/meal.dart';

//This class extends ChangeNotifier. 
//It will act as data repository for the meals and will be shared thorugh the application.
class MealDB extends ChangeNotifier{

  //The MealDB can be represented here as list of meals.
  List<Meal> meals = [];

  //Method to use to add a meal.
  void addMeal(Meal toAdd){
    meals.add(toAdd);
    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }//addProduct

  //Method to use to edit a meal.
  void editMeal(int index, Meal newMeal){
    meals[index] = newMeal;
    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }//editMeal

  //Method to use to delete a meal.
  void deleteMeal(int index){
    meals.removeAt(index);
    //Call the notifyListeners() method to alert that something happened.
    notifyListeners();
  }//deleteMeal
  
}//MealDB