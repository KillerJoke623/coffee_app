import 'package:flutter/material.dart';
import 'cart.dart';
import 'cart_item.dart';

class CartScreen extends StatelessWidget {
  final Cart cart; // Передаем корзину в конструктор

  const CartScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item.drink.name),
            subtitle: Text('${item.size} мл'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    cart.decrementItemCount(item);
                  },
                ),
                Text('${item.count}'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    cart.incrementItemCount(item);
                  },
                ),
                const SizedBox(width: 8),
                Text('${item.drink.prices![item.drink.sizes!.indexOf(item.size)] * item.count} руб.'),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    cart.removeItem(item); // Вызываем removeItem
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}