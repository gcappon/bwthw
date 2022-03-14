import 'animal.dart';
import 'eagle.dart';

void main(List<String> args) {

  //Create an Animal 
  Animal animal = Animal(name: 'Bob', weight: 10.0);
  
  //Use its methods
  animal.jump(); //this will print 'Jump'

  //Use its instance variables
  animal.weight = 30;

  //print it (it will use toString())
  print(animal); //This will print '(weight: 30.0, name: Bob)'

  //Create an Eagle
  Eagle eagle = Eagle(name: 'Jim', weight: 20.0);

  //Use its methods (inherited and its own)
  eagle.jump(); //this will print 'Jump'
  eagle.fly(); //this will print 'Fly'

  //Use its instance variables (inherited)
  eagle.name = 'Carl';

  //print it (it will use the inherited toString())
  print(eagle); //This will print '(weight: 20.0, name: Carl)'

}//main