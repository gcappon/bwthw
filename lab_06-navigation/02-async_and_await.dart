//A (fixed) asyncronous function
Future<void> fetchUserOrder() async {
  // Imagine that this function is fetching user info from another service or database.
  await Future.delayed(const Duration(seconds: 2), () => print('Large Latte'));
}//fetchUserOrder

//Note that main is a (fixed) asynchronous function now since it performs at least one asyncronous operation
Future<void> main() async {

  print('Fetching user order...');

  //Calling (correctly) the asynchronous function
  await fetchUserOrder();

  //Note that the following print will now perform after the previous asynchronous function
  print('Done');

}//main