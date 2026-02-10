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

  void eat(){
    print('Animal is eating!');
  }//eat 

  @override 
  String toString() {
    return '(weight: $weight, name: $name)';
  }//toString
}//Animal

//This is the definition of the subclass Cat
class Cat extends Animal{
  
  // -- Constructors
  Cat({required name, required weight}) : super(name : name, weight: weight);

  @override
  void eat(){
    print('Cat is eating!');
  }//fly

  @override
  String toString() {
    return super.toString();
  }//toString
}//Cat

//This is the definition of the subclass Cat
class Koala extends Animal{
  
  // -- Constructors
  Koala({required name, required weight}) : super(name : name, weight: weight);

  @override
  void eat(){
    print('Koala is eating!');
  }//fly

  @override
  String toString() {
    return super.toString();
  }//toString
}//Koala

void main(List<String> args) {
  
  // -- Method invocation
  Animal cat1 = Cat(name: 'Fuffy', weight: 10.0);
  Cat cat2 = Cat(name: 'Polly', weight: 20.0);

  cat1.eat(); //This will print 'Cat is eating!'
  cat2.eat(); //This also will print 'Cat is eating!'


  // -- Casting 

  //Widening casts are always ok
  Cat cat = Cat(name: 'Fuffy', weight: 10.0);
  Animal animal = cat;
  
  //Narrowing casts must be explicit and can fail
  Animal animal1 = Cat(name: 'Fuffy', weight: 10.0);
  Animal animal2 = Koala(name: 'John', weight: 50.0);
  Cat c1 = animal1 as Cat; //This is ok
  try{
    Cat c2 = animal2 as Cat; //This will fail
  }catch(e){
    print('The cast failed!');
  }//try-catch 
  
}//main