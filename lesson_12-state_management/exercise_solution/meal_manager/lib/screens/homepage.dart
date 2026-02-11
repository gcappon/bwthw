import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meal_manager/models/mealDB.dart';
import 'package:meal_manager/screens/mealpage.dart';
import 'package:meal_manager/utils/formats.dart';
import 'package:provider/provider.dart';

//Homepage screen. It will show the list of meals.
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
        //Here we are using a Consumer because we want the UI showing 
        //the list of meals to rebuild every time the meal DB updates.
        child: Consumer<MealDB>(
          builder: (context, mealDB, child) {
            //If the list of meals is empty, show a simple Text, otherwise show the list of meals using a ListView.
            return mealDB.meals.isEmpty
                ? Text('The meal list is currently empty')
                : ListView.builder(
                    itemCount: mealDB.meals.length,
                    itemBuilder: (context, mealIndex) {
                      //Here, I'm showing to you some new things:
                      //1. We are using the Card widget to wrap each ListTile to make the UI prettier;
                      //2. I'm using DateTime to manage dates;
                      //3. I'm using a custom DateFormats to format the DateTime (take a look at the utils/formats.dart file);
                      //4. Improving UI/UX adding a leading and a trailing to the ListTile
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Icon(MdiIcons.pasta),
                          trailing: Icon(MdiIcons.noteEdit),
                          title:
                              Text('CHO : ${mealDB.meals[mealIndex].carbohydrates}'),
                          subtitle: Text('${Formats.fullDateFormatNoSeconds.format(mealDB.meals[mealIndex].dateTime)}'),
                          //When a ListTile is tapped, the user is redirected to the MealPage, where it will be able to edit it.
                          onTap: () => _toMealPage(context, mealDB, mealIndex),
                        ),
                      );
                    });
          },
        ),
      ),
      //Here, I'm using a FAB to let the user add new meals.
      //Rationale: I'm using -1 as mealIndex to let MealPage know that we want to add a new meal.
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.plus),
        onPressed: () => _toMealPage(context, Provider.of<MealDB>(context, listen: false), -1),
      ),
    );
  } //build

  //Utility method to navigate to MealPage
  void _toMealPage(BuildContext context, MealDB mealDB, int mealIndex) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MealPage(mealDB: mealDB, mealIndex: mealIndex,)));
  } //_toMealPage
} //HomePage
