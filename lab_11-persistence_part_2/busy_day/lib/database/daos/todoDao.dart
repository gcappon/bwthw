import 'package:busy_day/database/entities/todo.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class TodoDao {

  //Query #1: SELECT -> this allows to obtain all the entries of the Todo table
  @Query('SELECT * FROM Todo')
  Future<List<Todo>> findAllTodos();

  //Query #2: INSERT -> this allows to add a Todo in the table
  @insert
  Future<void> insertTodo(Todo todo);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  @delete
  Future<void> deleteTodo(Todo task);

}//TodoDao