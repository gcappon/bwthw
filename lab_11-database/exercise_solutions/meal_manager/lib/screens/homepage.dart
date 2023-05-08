import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meal_manager/database/entities/meal.dart';
import 'package:meal_manager/repositories/databaseRepository.dart';
import 'package:meal_manager/screens/mealpage.dart';
import 'package:meal_manager/utils/formats.dart';
import 'package:provider/provider.dart';

//Homepage screen. It will show the list of meals.
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routeDisplayName = 'Homepage';

  @override
  Widget build(BuildContext context) {
    //Print the route display name for debugging
    print('${HomePage.routeDisplayName} built');
    
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routeDisplayName),
      ),
      body: Center(
        //We will show the Meal table with a ListView.
        //To do so, we use a Consumer of DatabaseRepository in order to rebuild the widget tree when
        //entries are deleted, created or updated.
        child: Consumer<DatabaseRepository>(
          builder: (context, dbr, child) {
            //The logic is to query the DB for the entire list of Meal using dbr.findAllMeals()
            //and then populate the ListView accordingly.
            //We need to use a FutureBuilder since the result of dbr.findAllMeals() is a Future.
            return FutureBuilder(
              initialData: null,
              future: dbr.findAllMeals(),
              builder:(context, snapshot) {
                if(snapshot.hasData){
                  final data = snapshot.data as List<Meal>;
                  //If the Meal table is empty, show a simple Text, otherwise show the list of meals using a ListView.
                  return data.length == 0 ? Text('The meal list is currently empty') : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, mealIndex) {
                      //Here, we are using a Card to show a Meal
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Icon(MdiIcons.pasta),
                          trailing: Icon(MdiIcons.noteEdit),
                          title:
                              Text('CHO : ${data[mealIndex].carbohydrates}'),
                          subtitle: Text('${Formats.fullDateFormatNoSeconds.format(data[mealIndex].dateTime)}'),
                          //When a ListTile is tapped, the user is redirected to the MealPage, where it will be able to edit it.
                          onTap: () => _toMealPage(context, data[mealIndex]),
                        ),
                      );
                    });
                }//if
                else{
                  return CircularProgressIndicator();
                }//else
              },//FutureBuilder builder 
            );
          }//Consumer-builder
        ),
      ),
      //Here, I'm using a FAB to let the user add new meals.
      //Rationale: I'm using null as meal to let MealPage know that we want to add a new meal.
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.plus),
        onPressed: () => _toMealPage(context, null),
      ),
    );
  } //build

  //Utility method to navigate to MealPage
  void _toMealPage(BuildContext context, Meal? meal) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MealPage(meal: meal,)));
  } //_toMealPage
} //HomePage
