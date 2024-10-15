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
      child: Column(
        children: [
          Image.asset(imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('$price руб.'),
              ],
            ),
          ),
          IconButton(
            onPressed: onPlusPressed,
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }
}