import 'package:flutter/material.dart';

class DrinkCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int price;
  final VoidCallback onPlusPressed;

  const DrinkCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.onPlusPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox( // Ограничиваем высоту карточки
        height: 250, // Можно подстроить это значение
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Растягиваем содержимое по горизонтали
          children: [
            Expanded( // Занимаем все доступное пространство изображением
              child: Image.asset(
              imageUrl,
                fit: BoxFit.cover, // Растягиваем изображение на всю ширину
              ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Размещаем элементы по краям
                children: [
                  Text(
                  '$price руб.', // Здесь будет цена с учетом размера
                  ),
                  IconButton(
                    onPressed: onPlusPressed,
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}