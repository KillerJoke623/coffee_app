import 'package:flutter/material.dart';
import 'cart.dart';
import 'cart_item.dart';
import 'order_screen.dart';

class CartScreen extends StatefulWidget {
  final Cart cart; // Передаем корзину в конструктор

  const CartScreen({super.key, required this.cart});

  @override
  State<CartScreen> createState() => _CartScreenState();

}

class _CartScreenState extends State<CartScreen> {
  void _incrementCount(CartItem item) {
    setState(() {
      widget.cart.incrementItemCount(item);
    });
  }

  void _decrementCount(CartItem item) {
    setState(() {
      if (item.count > 1) {
        widget.cart.decrementItemCount(item);
      } else {
        widget.cart.removeItem(item); // Удаляем товар, если количество равно 1
      }
    });
  }
  
  void _removeItem(CartItem item){
    setState(() {
      widget.cart.removeItem(item);
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
          child:
            ListView.builder(
              itemCount: widget.cart.items.length,
              itemBuilder: (context, index) {
                final item = widget.cart.items[index];
                return ListTile(
                  title: Text(item.drink.name),
                  subtitle: Text('${item.size} мл'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => _decrementCount(item)
                      ),
                      Text('${item.count}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => _incrementCount(item),
                      ),
                      const SizedBox(width: 8),
                      Text('${item.drink.prices![item.drink.sizes!.indexOf(item.size)] * item.count} руб.'),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeItem(item),
                      ),
                    ],
                  ),
                );
                },
            ),
          ),
          Container( // Добавляем контейнер для кнопки
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.brown[100], // Цвет фона
              border: Border(
                top: BorderSide(color: Colors.brown[300]!), // Верхняя граница
                ),
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                'Итого: ${widget.cart.totalPrice} руб.',
                style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(cart: widget.cart), // Передаем корзину
                    ),
                  );
                },
                  child: const Text('Оформить заказ'),
                ),
              ]
            )
          )
        ]
      )
    );
  }
}