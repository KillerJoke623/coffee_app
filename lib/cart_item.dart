import 'drink.dart';

class CartItem {
  final Drink drink;
  final int size;
  int count;

  CartItem({
    required this.drink,
    required this.size,
    this.count = 1,
  });
}