//Create a Bus class that extends the Vehicle class and inherit everything from it.
//Properly inherit the superclass constructors 
//A bus must retain also the current_number_of_passengers and the max_number_of_passengers. 
//Each Bus has a constant max_number_of_passengers equal to 20 and the initial current_number_of_passengers is always 0.
//Implement a method board that increments the number of passengers by a given value (as much as possible) and return the new number of passengers.
//Remember to correclty manage the toString() method.
//Properly test the created class capabilities in the main function.

class Vehicle{
  bool is_moving = false; 
  final double max_speed;
  double mileage = 0;

  //Constructors
  Vehicle({required this.max_speed});
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

class Bus extends Vehicle{
  
  int current_number_of_passengers = 0;
  final int max_number_of_passengers = 20;

  //Bus constructors call the superclass constructors
  Bus({required double max_speed}) : super(max_speed: max_speed);
  Bus.used({required double max_speed, required double mileage}) : super.used(max_speed : max_speed, mileage: mileage);

  int board({required int passengers}){
    if((passengers + current_number_of_passengers) > max_number_of_passengers){
      current_number_of_passengers = max_number_of_passengers;
    } else{
      current_number_of_passengers += passengers;
    }
    return current_number_of_passengers;
  }//board

  @override 
  String toString() {
    return 'Bus(is_moving : $is_moving, max_speed : $max_speed, mileage : $mileage, current_number_of_passengers : $current_number_of_passengers, max_number_of_passengers : $max_number_of_passengers)';
  }//toString

}//Bus

//Create a Bus class that extends the Vehicle class and inherit everything from it.
//Properly inherit the superclass constructors 
//A bus must retain also the current_number_of_passengers and the max_number_of_passengers. 
//Each Bus has a constant max_number_of_passengers equal to 20 and the initial current_number_of_passengers is always 0.
//Implement a method board that increments the number of passengers by a given value (as much as possible) and return the new number of passengers.
//Remember to correclty manage the toString() method.
//Properly test the created class capabilities in the main function.

void main(List<String> args) {
  
  //Test the Bus unnmaed constructor
  Bus b1 = Bus(max_speed: 80);
  
  //Test toString()
  print(b1);

  //Test the Bus named constructor
  Bus b2 = Bus.used(max_speed: 80, mileage: 1000);

  //Test inherited start method
  b1.start();
  print(b1);

  //Test inherited stop method
  b1.stop();
  print(b1);

  //Test inherited addMiles method
  b1.addMiles(miles: 250);
  print(b1);

  //Test board method
  b1.board(passengers: 10);
  print(b1); //This should have 10 passengers

  b1.board(passengers: 25);
  print(b1); //This should have 20 passengers (max capacity)

}//main