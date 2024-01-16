//An asyncronous function
Future<void> fetchUserOrder() async{
  // Imagine that this function is fetching user info from another service or database.
  await Future.delayed(const Duration(seconds: 2), () => print('Large Latte'));
}//fetchUserOrder

//Note that main is an asynchronous function now since it performs at least one asyncronous operation
void main() async{

  print('Fetching user order...');

  //Calling the asynchronous function
  await fetchUserOrder();

  //Note that the following print will be performed BEFORE the completion of the above function
  print('Done');

}//main