import 'package:flutter/material.dart';
import 'menu_data.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        final drink = drinks[index];
        return ListTile(
          leading: Image.asset(drink.imageUrl!), // Отображаем изображение
          title: Text(drink.name),
          subtitle: Text(drink.category),
          trailing: Text('${drink.prices![0]} руб.'), // Отображаем цену
        );
      },
    );
  }
}