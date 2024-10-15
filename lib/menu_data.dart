import 'drink.dart';

final List<Drink> drinks = [
  Drink(
    name: 'Эспрессо',
    category: 'Классика',
    sizes: [250],
    prices: [140],
    imageUrl: 'assets/images/espresso.jpg', // Пример URL изображения
  ),
  Drink(
    name: 'Американо',
    category: 'Классика',
    sizes: [250, 350],
    prices: [140, 170],
    imageUrl: 'assets/images/americano.jpg',
  ),
  // ... другие напитки
];