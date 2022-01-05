//An asyncronous function
Future<void> fetchUserOrder() {
  // Imagine that this function is fetching user info from another service or database.
  return Future.delayed(const Duration(seconds: 2), () => print('Large Latte'));
}//fetchUserOrder

//Note that main is an asynchronous function now since it performs at least one asyncronous operation
void main() {

  print('Fetching user order...');

  //Calling the asynchronous function
  fetchUserOrder();

  //Note that the following print will be performed BEFORE the completion of the above function
  print('Done');

}//main