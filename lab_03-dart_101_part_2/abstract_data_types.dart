//This is the definition of the abstract class Drinkable
abstract class Drinkable {
  //Here we are saying that a class that wants to implement Drinkable
  //must provide a concrete definition of a method pour() with no arguments
  //and return type void.
  void pour();
}//Drinkable

//This is the definition of a class that is 
//implementing the abstract class Drinkable
class Beer implements Drinkable {
  //Here, we must provide a concrete definition of the methods
  //defined by the abstract class, i.e., pour()
  void pour() {
    print("Pouring a beer!");
  }//pour
}//Beer

void main(List<String> args) {
  //Same as superclasses and subclasses
  Drinkable drink = Beer();
  //This will print 'Pouring a beer!'
  drink.pour();
}//main