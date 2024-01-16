//Create a class Vehicle with max_speed, is_moving and mileage instance variables (properly choose the type of the variables). max_speed is constant. is_moving and milage must be properly initiatilized.
//Create an unnamed constructor with the minimum amount of input arguments.
//Create also a named constructor Vehicle.used that creates a new Vehicle with a given mileage.
//Implement two methods start and stop that properly set is_moving
//Implement also the toString() method of the Vehicle class. 
//Create a method addMiles that takes a named parameter miles, adds that value to the current mileage, and return the new mileage.

//Properly test the created class capabilities in the main function.

class Vehicle{
  bool is_moving = false; 
  final double max_speed;
  double mileage = 0;

  //Unnamed constructor
  //Here, we need to make it required because of its type
  Vehicle({required this.max_speed});

  //Again, mileage is required bacause of its type
  Vehicle.used({required this.max_speed, required this.mileage});

  void start(){
    is_moving = true;
  }//start

  void stop(){
    is_moving = false;
  }//stop

  double addMiles({required double miles}){
    mileage += miles;
    return mileage;
  }//addMiles

  @override
  String toString() {
    return 'Vehicle(is_moving : $is_moving, max_speed : $max_speed, mileage : $mileage)';
  }//toString
}//Vehicle

void main(List<String> args) {

  //Test unnamed constructor
  Vehicle v1 = Vehicle(max_speed: 100);

  //Test toString
  print(v1);

  //Test named constructor
  Vehicle v2 = Vehicle.used(max_speed: 200, mileage: 1000);
  print(v2);

  //Test start
  v1.start();
  print(v1);

  //Test stop
  v1.stop();
  print(v1);

  //Test addMiles
  print(v1.addMiles(miles: 100));
  print(v1);
  
}//main