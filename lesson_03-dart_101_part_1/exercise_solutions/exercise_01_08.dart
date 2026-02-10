//An Armstrong number is a number that is the sum of its own digits each raised to the power 
//of the number of digits. For example:
//9 is an Armstrong number, because 9 = 9^1 = 9
//10 is not an Armstrong number, because 10 != 1^2 + 0^2 = 1
//153 is an Armstrong number, because: 153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
//154 is not an Armstrong number, because: 154 != 1^3 + 5^3 + 4^3 = 1 + 125 + 64 = 190
//In the main function, write some code to determine whether a given number n is an Armstrong number.

import 'dart:math';

void main(List<String> args) {
  
  //Set the number to be check
  int n = 153;

  //Parse n to a string
  String nStr = n.toString();

  //Get the length of n 
  int length = nStr.length;

  //Initialize the sum of numbers
  int sum = 0;

  //Get the sum of each digit of n raised by the length of n
  for (var i = 0; i < length; i++) {
    sum += pow(int.parse(nStr[i]),length) as int;
  }//for 

  //Print the result
  if(sum == n){
    print('$n is an Armstrong number');
  }else{
    print('$n is not an Armstrong number');
  }//if-else
  
}//main
