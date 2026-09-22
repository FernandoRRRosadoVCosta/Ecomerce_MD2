import 'package:flutter/foundation.dart';
import 'package:more_devs_do_zero/features/cart/cart_item.dart' show CartItem;
import 'package:more_devs_do_zero/features/home/models/product_model.dart';

class CartController extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalItems => _items.fold(0, (total, item) => total + item.quantity);

  double get total {
    return _items.fold(0, (total, item) => total + item.subtotal);
  }

  bool containsProduct(Product product) {
    return _items.any(
      (item) =>
          item.product.name == product.name &&
          item.product.brand == product.brand,
    );
  }

  CartItem? getCartItem(Product product) {
    for (final item in _items) {
      if (item.product.name == product.name &&
          item.product.brand == product.brand) {
        return item;
      }
    }

    return null;
  }

  void addProduct(Product product) {
    final item = getCartItem(product);
    if (item != null) {
      item.quantity++;
    } else {
      _items.add(CartItem(product: product, quantity: 1));
    }

    notifyListeners();
  }

  void increment(Product product) {
    final item = getCartItem(product);

    if (item != null) {
      item.quantity++;
      notifyListeners();
    }
  }

  void decrement(Product product) {
    final item = getCartItem(product);

    if (item == null) {
      return;
    }

    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }

    notifyListeners();
  }

  void removeProduct(Product product) {
    _items.removeWhere(
      (item) =>
          item.product.name == product.name &&
          item.product.brand == product.brand,
    );

    notifyListeners();
  }
}
