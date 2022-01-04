//Exercise 01.01. In the main function, given a number n, for all non-negative integers i < n, print i^4. 
//Do it using a for loop and a while loop.

import 'dart:math';

void main(List<String> args) {

  //Set the value of n
  int n = 10;

  //Solve the problem using a for loop
  for (var i = 0; i < n; i++) {
    print(pow(i, 4));
  }//for 

  //Solve the problem using the while loop
  int i = 0;
  while(i<n){
    print(pow(i, 4));
    i++;
  }//while

}//main