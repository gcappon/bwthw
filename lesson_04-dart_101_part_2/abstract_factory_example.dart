//This is the abstract product interface
abstract class Drinkable {
  void pour();
}//Drinkable

//This class implements the abstract product class and specifies a product concrete type: Beer
class Beer implements Drinkable {
  void pour() {
    print("Pouring a beer!");
  }//pour
}//Beer

//This class implements the abstract product class and specifies a product concrete type: Coffee
class Coffee implements Drinkable {
  void pour() {
    print("Pouring a coffee!");
  }//pour
}//Coffee

//This is the abstract factory interface
abstract class DrinkFactory {
  Drinkable createDrink();
}//DrinkFactory

//This class implements the abstract factory class and specifies a factory concrete type: Pub
class Pub implements DrinkFactory {
  Drinkable createDrink() {
    return Beer();
  }//createDrink
}//Pub

//This class implements the abstract factory class and specifies a factory concrete type: CoffeeShop
class CoffeeShop implements DrinkFactory {
  Drinkable createDrink() {
    return Coffee();
  }//createDrink
}//CoffeeShop

void main() {
  var mood = "sleepy";

  //Here we are instantiating the abstract factory
  DrinkFactory destination;

  //We can leverage polymorphism to use the same instance object
  if(mood == "sleepy") {
      destination = CoffeeShop();
  }//if
  else{
      destination = Pub();
  }//else
  
  //This will assign to myBeverage a Coffee
  var myBeverage = destination.createDrink();

  //This will print "Pouring a coffee!"
  myBeverage.pour();
}//main