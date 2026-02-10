import 'dart:math';

void main(List<String> args) {

  double a = 4;
  double b = 5;

  // --- Arithmetic operators
  print(a+b); //Add: this will print '9.0'
  print(a-b); //Subtract: this will print '-1.0'
  print(a*b); //Multiply: this will print '20.0'
  print(a/b); //Divide: this will print '0.8'
  print(a~/b); //Integer division: this will print '0'
  print(a%b); //Remainder of the division: this will print '4.0'

  // --- Arithmetic operations using the dart:math library
  print(pow(a,b)); //Elevate: this will print '1024.0'
  print(log(a)); //Logarithm: this will print '1.38...'
  print(pi); //This will print the PI constant

  // --- Prefix, postfix operators
  int m = 0;
  int n = 0;
  n = m++; //First assigns to n the value of m, then it increments m
  print(m); //This will print '1'
  print(n); //This will print '0'

  n = ++m; //First increments the value of m, then assigns to n the value of m
  print(m); //This will print '2'
  print(n); //This will print '2'

  // --- Relational operator
  int x = 0;
  int y = 1;
  print(x == y); //This will print 'false'
  print(x != y); //This will print 'true'
  print(x > y); //This will print 'false'
  print(x < y); //This will print 'true'
  print(x >= y); //This will print 'false'
  print(x <= y); //This will print 'true'

  // --- Logical operators
  bool flag1 = true;
  bool flag2 = false;
  print(flag1 && flag2); //AND: This will print 'false'
  print(flag1 || flag2); //OR: This will print 'true'
  print(!flag1); //NOT: This will print 'false'
  print(flag1 ? 'Hello' : 'World'); //Ternary operator: This will print 'Hello'

  // --- Type tester
  double c = 0;
  print(c is double); //This will print 'true'
  print(c is! double); //This will print 'false'

}//main