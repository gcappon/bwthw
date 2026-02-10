void main(List<String> args) {
  
  // In Dart, every variable has a nullable type
  int a; //Non-nullable int type
  int? b; //Nullable int type

  //Un-initialized non-nullable typed variables must be assigned before they can be used.
  a = 3;
  print(a);

  //On the other hand, un-initialized nullable typed variables can (they have null value by default).
  print(b);

  //This system (null-safety) allows to be 100% sure whether an expression can be null or not.
  //If you want to assign a value to a non-nullable variable using a nullable expression (that you 
  //know for sure that it is not null in that specific moment), you can add a ! to assert that it 
  //is not null. It will throw an exception if you are wrong.
  int c = 0;
  try{
    print('Trying to assign the value of b to c.');
    c = b!;
  } catch (e){
    print('b variable was null!');
  }
  print(c);

}// main