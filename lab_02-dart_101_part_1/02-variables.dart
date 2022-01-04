void main(List<String> args) {
  
  // var can be used to create and initialize a variable

  var number = 42; // number contains a reference to a number object with value 42
  print(number);
  print('${number}'); // ${variableName} can be used inside a string to display
                      // the value of a variable in a specific place.
                      // SPOILER: this uses the toString() method.

  // final can be used to create and initialize a constant (run-time level).
  final name = 'Bob';
  print(name);

  // const can be used to create and initialize a constant (compile level).
  const pi = 3.14;
  print(pi);

  // The type of variables is inferred! Type can be also specified.
  final String anotherName = 'Jack'; //This will be a constant String
  print(anotherName);

  String thirdName = 'Luke'; // This will be a 'variable' String
  print(thirdName);

}// main