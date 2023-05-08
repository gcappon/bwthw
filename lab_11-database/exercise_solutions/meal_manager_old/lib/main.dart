import 'package:flutter/material.dart';
import 'package:meal_manager/database/database.dart';
import 'package:meal_manager/repositories/databaseRepository.dart';
import 'package:provider/provider.dart';
import 'package:meal_manager/screens/mealpage.dart';
import 'package:meal_manager/screens/homepage.dart';

Future<void> main() async {
  //This is a special method that use WidgetFlutterBinding to interact with the Flutter engine.
  //This is needed when you need to interact with the native core of the app.
  //Here, we need it since when need to initialize the DB before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  //This opens the database.
  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //This creates a new DatabaseRepository from the AppDatabase instance just initialized
  final databaseRepository = DatabaseRepository(database: database);

  //Here, we run the app and we provide to the whole widget tree the instance of the DatabaseRepository.
  //That instance will be then shared through the platform and will be unique.
  runApp(ChangeNotifierProvider<DatabaseRepository>(
    create: (context) => databaseRepository,
    child: MyApp(),
  ));
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //This specifies the entrypoint
      initialRoute: HomePage.route,
      //Here, I'm demonstrating another way to manage Navigation. This approach can be handy when you need to
      //pass data to a route directly to its constructor and you want to continue to use pushNamed().
      onGenerateRoute: (settings) {
        if (settings.name == HomePage.route) {
          return MaterialPageRoute(builder: (context) {
            return HomePage();
          });
        } else if (settings.name == MealPage.route) {
          final args = settings.arguments as Map;
          return MaterialPageRoute(builder: (context) {
            //Compared to exercise 07.01, I'm passing only the Meal object. We will get access to the DB via
            //the provided DatabaseRepository and we will get the id of the meal from the Meal entry itself.
            return MealPage(meal: args['meal']);
          });
        } else {
          return null;
        } //if-else
      }, //onGenerateRoute
    );
  } //build
} //MyApp
