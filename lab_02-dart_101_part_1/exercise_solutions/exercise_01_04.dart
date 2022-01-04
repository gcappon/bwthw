//Write a function with an optional named parameter up, that, for a given string, 
//provided by the main function, make it upper case if up is true, lower case otherwise. 
//By default, up is false. Then print the result in the main function.

//Function that make a string upper case if told to do so.
String makeItUp(String str, {bool up = false}){

  //If up is true return the string in upper case
  if(up){
    return str.toUpperCase();
  }//if

  //If not, return the string in lower case
  return str.toLowerCase();
  
}//makeItUp

void main(List<String> args) {
  
  //Set a string
  String str = 'helLo';

  //Call the function with the default behavior
  print(makeItUp(str));

  //Call the function providing the optional parameter
  print(makeItUp(str, up: false));
  print(makeItUp(str, up: true));

}//main
