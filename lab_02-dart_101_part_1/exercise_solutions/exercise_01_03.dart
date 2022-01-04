//Write a function that, given a string, provided by the main function, returns 
//the same text with swapped cases. Then print the result in the main function.

//Function that swap cases of a given string.
String swapCases(String str){

  //Initialize an empty string
  String ret = '';

  //For each character of the string...
  for (var i = 0; i < str.length; i++) {

    //If the i-th characters is equal to its lower case version, means that it is low case
    if(str[i] == str[i].toLowerCase()){
      //Transform it to upper case
      ret += str[i].toUpperCase();
    }else{
      //Otherwise, transform it to lower case
      ret += str[i].toLowerCase();
    }//if-else

  }//for

  //Return the transformed string
  return ret;

}//swapCases

void main(List<String> args) {

  //Set the string to be transformed.
  String str = 'hElLO WOrld.';

  //Print the string with swapped cases.
  print(swapCases(str));

}//main