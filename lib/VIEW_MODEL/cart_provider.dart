import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  String name;
  String desc;
  String imgurl;
  double quantity;
  double price;

  CartItem(
      {this.id, this.name,this.desc, this.imgurl, this.quantity, this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

 bool addItem(
      {String imgurl,
      String pdtid,
      String name,
      String desc,
      String companyName,
      double quantitiy,
      double price}) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              name: existingCartItem.name,
              desc: existingCartItem.desc,
              imgurl: existingCartItem.imgurl,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          pdtid,
          () => CartItem(
                imgurl: imgurl,
                name: name,
                desc: desc,
                id: pdtid,
                quantity: quantitiy,
                price: price,
              ));
    }
    notifyListeners();
    return true;
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              imgurl: existingCartItem.imgurl,
              desc: existingCartItem.desc,
              id: existingCartItem.id,
              name: existingCartItem.name,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
