class Animal{

  double? weight;
  String? name;

  Animal();
  Animal.withName(this.name);
  
  void jump(){
    print('Jump');
  }//jump

  void eat(){
    print('Omnivorous');
  }//eat

  @override 
  String toString() {
    return '(weight: $weight, name: $name)';
  }//toString
}//Animal

//To extend a class, use the extends keyword
class Eagle extends Animal{

  Eagle() : super();
  Eagle.withName(name) : super.withName(name);

  void fly(){
    print('Fly');
  }//fly

  @override
  void eat(){
    print('Carnivorous');
  }//eat

  @override
  String toString() {
    return super.toString();
  }//toString
}//Eagle

void main(List<String> args) {

  //Create an Animal 
  Animal animal = Animal();
  
  //Use its methods
  animal.jump(); //this will print 'Jump'
  animal.eat(); //this will print 'Omnivorous'

  //Use its instance variables
  animal.weight = 10;

  //print it (it will use toString())
  print(animal); //This will print '(weight: 10.0, name: null)'

  //Create an Eagle
  Eagle eagle = Eagle();

  //Use its methods (inherited and overwritten)
  eagle.jump(); //this will print 'Jump'
  eagle.eat(); //this will print 'Carnivorous'

  //Use its instance variables (inherited)
  eagle.name = 'Bob';

  //print it (it will use the inherited toString())
  print(eagle); //This will print '(weight: null, name: Bob)'

}//main