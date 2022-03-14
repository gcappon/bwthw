import 'animal.dart';

//To extend a class, use the extends keyword
class Eagle extends Animal{
  
  // -- Constructors
  Eagle({required name, required weight}) : super(name : name, weight: weight);

  void fly(){
    print('Fly');
  }//fly

  @override
  String toString() {
    return super.toString();
  }//toString
}//Eagle