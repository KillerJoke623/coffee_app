import 'package:flutter/material.dart';
import 'drink_card.dart';
import 'menu_data.dart';
import 'cart.dart';
import 'cart_item.dart';

class MenuScreen extends StatelessWidget {
  final Cart cart; // Добавляем параметр cart

  const MenuScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // Устанавливаем максимальную ширину карточки
        childAspectRatio: 0.7,
      ),
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        final drink = drinks[index];
        return DrinkCard(
          imageUrl: drink.imageUrl!,
          name: drink.name,
          sizes: drink.sizes!, // Передаем список размеров
          prices: drink.prices!, // Передаем список цен
          onSizeSelected: (size) { // Добавляем обработчик выбора размера
            print('Выбран размер $size мл для ${drink.name}');
            // Здесь можно обновить состояние корзины
          },
          onPlusPressed: (size) {
            // Здесь будет обработка добавления в корзину
            if (size != null) {
              cart.addItem(CartItem(drink: drink, size: size)); // Добавляем товар в корзину
              print('Напиток ${drink.name} ($size мл) добавлен в корзину');
            } else {
              print('Выберите размер напитка');
            }
          },
        );
      },
    );
  }
}