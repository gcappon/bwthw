import 'package:meal_manager/database/entities/meal.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class MealDao {

  //Query #1: SELECT -> this allows to obtain all the entries of the Meal table
  @Query('SELECT * FROM Meal')
  Future<List<Meal>> findAllMeals();

  //Query #2: INSERT -> this allows to add a Meal in the table
  @insert
  Future<void> insertMeal(Meal meal);

  //Query #3: DELETE -> this allows to delete a Meal from the table
  @delete
  Future<void> deleteMeal(Meal task);

  //Query #4: UPDATE -> this allows to update a Meal entry
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateMeal(Meal meal);
  
}//MealDao