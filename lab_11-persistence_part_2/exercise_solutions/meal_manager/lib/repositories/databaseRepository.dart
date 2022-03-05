import 'package:meal_manager/database/database.dart';
import 'package:meal_manager/database/entities/meal.dart';
import 'package:flutter/material.dart';

class DatabaseRepository extends ChangeNotifier{

  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllMeals() method of the DAO
  Future<List<Meal>> findAllMeals() async{
    final results = await database.mealDao.findAllMeals();
    return results;
  }//findAllMeals

  //This method wraps the insertMeal() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> insertMeal(Meal meal)async {
    await database.mealDao.insertMeal(meal);
    notifyListeners();
  }//insertMeal

  //This method wraps the deleteMeal() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> removeMeal(Meal meal) async{
    await database.mealDao.deleteMeal(meal);
    notifyListeners();
  }//removeMeal
  
  //This method wraps the updateMeal() method of the DAO. 
  //Then, it notifies the listeners that something changed.
  Future<void> updateMeal(Meal meal) async{
    await database.mealDao.updateMeal(meal);
    notifyListeners();
  }//updateMeal

}//DatabaseRepository