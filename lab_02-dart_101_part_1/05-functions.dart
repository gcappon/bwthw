//To implement a function you can use the syntax
//returnType functionName(typeInputParam1 nameInputParam1, typeInputParam2 nameInputParam2){functionBody}:
double sumTwoNumbers(double a, double b){
  return a + b;
}//sumTwoNumbers

//Dart is truly object-oriented: even functions are objects of type Functions. This means that 
//they can be an input of another function:
double doSomethingWithNumbers(Function foo, double a, double b){
  return foo(a,b);
}//doSomeThingWithNumbers

//For functions that contain just one expression, you can use the 'arrow syntax':
double doSomethingWithNumbersArrow(Function foo, double a, double b) => foo(a,b);

//Example of function with named parameters. Note that the parameters are nullable because
//they are optional. So, if not specified, their default value is null.
double doSomethingWithNumbersNamed(Function foo, {double? a, double? b}) => foo(a,b);

//Example of function with required named parameters. 
double sumTwoNumbersNamed({required double a, required double b}) => a+b;

//Example of function with default named parameters. 
double sumTwoNumbersDefaultNamed({required double a, double b = 0}) => a+b;

//Example of function with optional positional parameters.
String sayHi([String? name]){
  if(name != null){
    return 'Hi ' + name + '!';
  }//if
  return 'Hi!';
}//sayHi

//Example of function with optional positional parameters with default values.
String sayHiDefault([String name = '']) => 'Hi ' + name;

void main(List<String> args) {
  
  // --- Functions
  print(sumTwoNumbers(3,4)); //This will print '7.0'

  print(doSomethingWithNumbers(sumTwoNumbers, 3, 4)); //This will print '7.0'

  print(doSomethingWithNumbersArrow(sumTwoNumbers, 3, 4)); //This will print '7.0'
  
  // --- Named parameters
  print(doSomethingWithNumbersNamed(sumTwoNumbers,a:3, b:4)); // This will print '7.0'

  try{
    print(doSomethingWithNumbersNamed(sumTwoNumbers,a:3)); // This fails
  }catch(e){
    print('This fails because the default value of b is null.');
  }//catch

  print(sumTwoNumbersNamed(a:3, b:4)); // This will print '7.0'

  print(sumTwoNumbersDefaultNamed(a:3)); // This will print '3.0'

  // --- Optional positional parameters
  print(sayHi()); //This will print 'Hi!'
  print(sayHi('Paul')); //This will print 'Hi Paul!'
  
  print(sayHiDefault()); //This will print 'Hi'
  print(sayHiDefault('Paul')); //This will print 'Hi Paul'

}//main