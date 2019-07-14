import 'package:flutter/foundation.dart';

class Item {
  final double price;
  final String name;

  Item(this.price, this.name);
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  int get totalPrice => _items.length * 42;

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    print('CartModel disposed');
    super.dispose();
  }
}