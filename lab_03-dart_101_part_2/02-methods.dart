class Animal{
  //Instance variables that are uninitialized have the value null (that's why we put the ? there) 
  double? weight;
  String? name;
  
  //Unnamed constructor. Only one unnamed constructor can be created. 
  Animal();

  //Named constructor 1. Multiple named constructors can be created.
  Animal.withName(this.name);
  /* Equivalent to 
  Animal({String? name}){
    this.name = name;
  }//Animal
  */

  //Named constructor 2.
  Animal.withWeight({this.weight});
  
}//Animal

class Car{
  
  //Instance variables can be final. In this case, they must be set only once (in the constructor).
  final String? manufacturer;
  bool? isEletric;
  int? mileageSinceRevision;

  //Constructors
  Car({this.manufacturer});
  Car.used({this.manufacturer, this.mileageSinceRevision});

  //A method that performs a revision of the Car
  void doRevision(){
    mileageSinceRevision = 0;
    //...other revision things...
  }//doRevision

}//Car

void main(List<String> args) {

  //Buy a used Ferrari that needs a revision
  var car = Car.used(manufacturer: 'Ferrari', mileageSinceRevision: 1000);

  //Do revision (methods can be used using the dot notation)
  car.doRevision();

  print(car.mileageSinceRevision); // This will print 0
  
}//main