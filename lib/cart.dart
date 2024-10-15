import 'cart_item.dart';

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    final existingItem = _items.firstWhere(
          (i) => i.drink == item.drink && i.size == item.size,
      orElse: () => CartItem(drink: item.drink, size: item.size, count: 0),
    );
    if (existingItem.count == 0) {
      _items.add(item);
    } else {
      existingItem.count++;
    }
  }

  void removeItem(CartItem item) {
    _items.remove(item);
  }

  void clear() {
    _items.clear();
  }

  int get totalPrice {
    var total = 0;
    for (final item in _items) {
      final priceIndex = item.drink.sizes!.indexOf(item.size);
      total += item.drink.prices![priceIndex] * item.count;
    }
    return total;
  }

  void incrementItemCount(CartItem item) {
    item.count++;
  }

  void decrementItemCount(CartItem item) {
    item.count--;
  }
}