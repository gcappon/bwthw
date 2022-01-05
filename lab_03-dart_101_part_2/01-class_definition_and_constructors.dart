class Animal{
  //Instance variables that are uninitialized have the value null (that's why we put the ? there) 
  double? weight;
  String? name;
  
  //Unnamed constructor. Only one unnamed constructor can be created. 
  Animal();

  //Named constructor 1. Multiple named constructors can be created.
  Animal.withName(this.name);
  /* Equivalent to 
  Animal(String? name){
    this.name = name;
  }//Animal
  */

  //Named constructor 2.
  Animal.withWeight({this.weight});
  
  //Named constructor 3.
  Animal.fuffy() : name = 'Fuffy', weight = 2;

}//Animal

void main(List<String> args) {
  
  //How to create an object using the unnamed constructor
  var animal = Animal();

  //How to create an object using the named constructors
  var animal2 = Animal.withName('GoodBoy');
  var animal3 = Animal.withWeight(weight: 10);
  var animal4 = Animal.fuffy();

  //Instance variables of animal can be accessed using the dot notation
  animal.weight = 100;
  print(animal.weight); // This will print '100.0'
  assert(animal.name == null); // This will print 'null'

}//main