void main(List<String> args) {
  
  // In Dart, everything is an object. However, Dart express a set of special types for common use.

  // --- Numbers
  int anInteger = 3; //Integer numbers (64-bit).
  print(anInteger);

  double aDouble = 3; //Floating point numbers (64-bit - IEEE 754 standard).
  print(aDouble);
  print(double.nan); //Special constant 1: not-a-number
  print(double.negativeInfinity); //Special constant 2: -inf
  print(double.infinity); //Special constant 3: inf
  print(double.minPositive); //Special constant 4: minimum representable number
  print(double.maxFinite); //Special constant 5: maximum representable positive number

  // Parse a String to an int
  var one = int.parse('1');
  assert(one == 1);

  // Parse a String to a double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // Parse an int to a String
  String anIntegerAsString = anInteger.toString();
  assert(anIntegerAsString == '3');

  // Parse double to a String
  String aDoubleAsString = aDouble.toString();
  assert(aDoubleAsString == '3.0');


  // --- Strings

  //To represent strings, Dart uses the String class.
  String s1 = 'Single quotes work well for string literals.';
  String s2 = "Double quotes work just as well.";
  String s3 = 'It\'s easy to escape the string delimiter.';
  String s4 = "It's even easier to use the other delimiter.";

  //As we saw, it is possible to interpolate an expression inside a String using
  //${expression}
  int a = 4;
  int b = 3;
  print('a + b = ${a+b}');

  //Strings can be concatenated using +
  final hello = 'Hello';
  final world = 'world';
  print(hello + ' ' + world + '!');

  //As you imagine, the String class has many handy methods and variables. Here's some examples:
  final str = 'test string';
  print(str.length); //Gets the length of a string
  print(str.toUpperCase()); //Converts the whole string to upper case
  print(str.contains('str')); //Checks if a string contains a pattern
  print(str.indexOf('str')); //Tells where a pattern is within a string


  // --- Booleans

  //To represent booleans, Dart uses the bool type
  bool flag = true; //or false
  print(flag);


  // --- Lists
  
  //Arrays, in Dart, are represented as List objects. 
  var listInferred = [1,2,3]; //Type inferred
  List<int> listNotInferred = [1,2,3]; //Type explicited
  assert(listInferred == listNotInferred);

  //List elements can be accessed by index (they start from 0)
  print(listInferred[1]); //This will print '2'

  //Length of a list can be accessed via the length instance variable
  print(listInferred.length); //This will print '3' 

  //As strings, Dart comes with handy features for lists
  print(listInferred.reversed); //This will obtain the list in reversed order
  listInferred.add(4); //This will add a 4 to the tail of the list
  listInferred = [0, ...listInferred]; //This will add a 0 to the head of the list (using the spread operator)
  print(listInferred);
  

  // --- Maps 

  //A useful collection type in Dart is the Map type. A Map is an object that associates keys and values.
  //Each key occurs only once, values can occur multiple times.

  var mapInferred = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  }; //Type inferred
  Map<int, String> mapNotInferred = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  }; //Type not inferred
  assert(mapInferred == mapNotInferred);
  
  //Elements of a Map can be accessed via the key.
  print(mapInferred[2]); //This will print 'helium'

  //It is possible to add key-value pairs to the Map by simply
  mapInferred[1] = 'hydrogen';
  print(mapInferred);

  //Values of a Map can be overwritten 
  mapInferred[1] = 'H';
  print(mapInferred);

  //Handy features are also present for Maps
  print(mapInferred.length); //This will print the length of the Map
  print(mapInferred.containsKey(2)); //This will check is a key exists in the Map
  
}// main