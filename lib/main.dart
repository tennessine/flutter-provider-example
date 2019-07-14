import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

void main() => runApp(
      ChangeNotifierProvider(
        builder: (BuildContext context) {
          return CartModel();
        },
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Consumer(builder: (context, CartModel cart, child) {
              return Text('Total price is: ${cart.totalPrice}');
            }),
            RaisedButton(
              onPressed: () {
                Provider.of<CartModel>(context).add(Item(1.23, 'apple'));
              },
              child: Text('增加'),
            ),
            RaisedButton(
              onPressed: () {
                Provider.of<CartModel>(context).clear();
              },
              child: Text('清空'),
            ),
          ],
        ),
      ),
    );
  }
}
