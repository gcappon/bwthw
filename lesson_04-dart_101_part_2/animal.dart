//This is the definition of the superclass Animal
class Animal{

  // -- Instance variables
  double weight;
  String name;

  // -- Constructors
  Animal({required this.name, required this.weight});
  
  // -- Methods
  void jump(){
    print('Jump');
  }//jump

  @override 
  String toString() {
    return '(weight: $weight, name: $name)';
  }//toString
}//Animal