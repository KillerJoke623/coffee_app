import 'package:flutter/material.dart';
import 'drink_card.dart';
import 'menu_data.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        final drink = drinks[index];
        return DrinkCard(
          imageUrl: drink.imageUrl!,
          name: drink.name,
          price: drink.prices![0], // Берем первую цену
          onPlusPressed: () {
            // Здесь будет обработка добавления в корзину
            print('Напиток ${drink.name} добавлен в корзину');
          },
        );
      },
    );
  }
}