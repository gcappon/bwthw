import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/models/cart.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  static const routename = 'Cartpage';

  @override
  Widget build(BuildContext context) {
    print('${CartPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        actions: [
          //Here, we only need to set the action to perform after the button is pressed. So, it is not necessary to use a Consumer.
          //This approach won't cause the IconButton widget to rebuild when the notifyListeners() method is called. 
          IconButton(onPressed: () => Provider.of<Cart>(context, listen: false).clearCart(), icon: Icon(Icons.delete))
        ],
        title: Text(CartPage.routename),
      ),
      body: Center(
          //On the other hand, here we need a Consumer, since we want the UI to update if the notifyListeners() method is called
          // for example, after the tap of the IconButton in the AppBar.
          child: Consumer<Cart>(
            builder: (context, cart, child) {
              return Text('You have ${cart.products.length} items in your cart.');
            },
      ), ),
      );
    
  } //build

} //CartPage
