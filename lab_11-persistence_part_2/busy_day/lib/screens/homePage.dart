import 'package:busy_day/database/entities/todo.dart';
import 'package:busy_day/repository/databaseRepository.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

//HomePage can be Steless. Only the ListView content changes, not the HomePage by itself.
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'HomePage';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routename),
      ),
      //The FAB is used to add random entries to the Todo table
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final wp = WordPair.random();
            //No need to use a Consumer, we are just using a method of the DatabaseRepository
            await Provider.of<DatabaseRepository>(context, listen: false)
                .insertTodo(Todo(null, wp.first));
          },
          child: Icon(Icons.add)),
      body: Center(
        child:
            //We will show the todo table with a ListView.
            //To do so, we use a Consumer of DatabaseRepository in order to rebuild the widget tree when
            //entries are deleted or created.
            Consumer<DatabaseRepository>(builder: (context, dbr, child) {
          //The logic is to query the DB for the entire list of Todo using dbr.findAllTodos()
          //and then populate the ListView accordingly.
          //We need to use a FutureBuilder since the result of dbr.findAllTodos() is a Future.
          return FutureBuilder(
            initialData: null,
            future: dbr.findAllTodos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as List<Todo>;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, todoIndex) {
                      final todo = data[todoIndex];
                      return Card(
                        elevation: 5,
                        //Here we use a Dismissible widget to create a nicer UI.
                        child: Dismissible(
                          //Just create a dummy unique key
                          key: UniqueKey(),
                          //This is the background to show when the ListTile is swiped
                          background: Container(color: Colors.red),
                          //The ListTile is used to show the Todo entry
                          child: ListTile(
                            leading: Icon(MdiIcons.note),
                            title: Text(todo.name),
                            subtitle: Text('ID: ${todo.id}'),
                            //If the ListTile is tapped, it is deleted
                          ),
                          //This method is called when the ListTile is dismissed
                          onDismissed: (direction) async {
                            //No need to use a Consumer, we are just using a method of the DatabaseRepository
                            await Provider.of<DatabaseRepository>(context,
                                    listen: false)
                                .removeTodo(todo);
                          },
                        ),
                      );
                    });
              } else {
                //A CircularProgressIndicator is shown while the list of Todo is loading.
                return CircularProgressIndicator();
              } //else
            },//builder of FutureBuilder
          );
        }),
      ),
    );
  } //build

} //HomePage
