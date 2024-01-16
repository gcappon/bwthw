import 'dog.dart';

void main(List<String> args) {
  
  //Here, I am creating an instance of the class Dog using the defined constructor. 
  //In other words, d is an object of class Dog. 
  final d = Dog(name: 'Bob', weight: 10, color: 'Black');

  //Here, I'm using a method of d
  d.bark();

  //Instance variables are accessible by default in Dart
  print('d weights ${d.weight} kg');
  print('d weights ${d.eat()} kg');

}//main