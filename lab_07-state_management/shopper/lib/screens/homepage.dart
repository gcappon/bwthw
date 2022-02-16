import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopper/models/cart.dart';
import 'package:shopper/models/catalog.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'Homepage';

  final Catalog catalog = Catalog();

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routename),
        actions: [
          IconButton(
              onPressed: () => _toCartPage(context), icon: Icon(MdiIcons.cart))
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: catalog.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(catalog.products[index]),
                //Here, we only need to set the action to perform after the button is pressed. So, it is not necessary to use a Consumer.
                //This approach won't cause the ListTile widget to rebuild when the notifyListeners() method is called. 
                onTap: () => Provider.of<Cart>(context, listen: false)
                    .addProduct(catalog.products[index]),
              );
            }),
      ),
    );
  } //build

  void _toCartPage(BuildContext context) {
    Navigator.pushNamed(context, '/cart');
  }
} //HomePage
