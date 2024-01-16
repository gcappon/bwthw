//Write a function that given a string provided by the main function, 
//converts that string to its acronym. Then print the result in the main function.
//For example:  Portable Network Graphics will generate PNG.

//Function that returns the acronym of a given string
String getAcronym(String str){

  //Initialize an empty string
  String ret = '';

  //Split the string into its words using split()
  final words = str.split(' ');

  //For each word
  for (var word in words) {
    //Attach the first character (in upper case) to the return string
    ret += word[0].toUpperCase();
  }//for

  //Return the result
  return ret;
}//getAcronym

void main(List<String> args) {
  
  //Set the string to be acronymized
  String str = 'Portable Network graphics';

  //Get teh acronym
  final acr = getAcronym(str);

  //Print the result
  print(acr);

}//main