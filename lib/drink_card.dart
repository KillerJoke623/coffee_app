import 'package:flutter/material.dart';

class DrinkCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final List<int> prices;
  final List<int> sizes;
  final void Function(int?) onPlusPressed;
  final Function(int? size) onSizeSelected;

  const DrinkCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.prices,
    required this.sizes,
    required this.onPlusPressed,
    required this.onSizeSelected,
  });

  @override
  State<DrinkCard> createState() => _DrinkCardState();
}


class _DrinkCardState extends State<DrinkCard> {
  int? _selectedSize; // Добавляем переменную для хранения выбранного размера
  int? _selectedPrice;

  @override
  void initState() {
    super.initState();
    _selectedSize = widget.sizes.first; // Выбираем самый маленький размер по умолчанию
    _selectedPrice = widget.prices.first;
  }

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
                widget.imageUrl,
                fit: BoxFit.cover, // Растягиваем изображение на всю ширину
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, // Выравниваем текст по центру
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                  Expanded(
                    child:
                      DropdownButton<int>(
                      // Добавляем DropdownButton
                      value: _selectedSize,
                      hint: const Text('Размер'),
                      items: widget.sizes.map((size) { // Используем widget.sizes
                        // final index = widget.sizes.indexOf(size);
                        return DropdownMenuItem(
                          value: size,
                          child: Text('$size мл'),
                          );
                      }).toList(),
                      onChanged: (size) {
                        setState(() {
                          _selectedSize = size;
                          final index = widget.sizes.indexOf(size!);
                          _selectedPrice = widget.prices[index];
                        });
                      },
                    ),
                  ),
                  IconButton(

                    onPressed: () => widget.onPlusPressed(_selectedSize),
                    icon: const Icon(Icons.add_circle),
                  ),
                ],
          ),
          ),
            Padding( // Добавляем отображение цены
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$_selectedPrice руб.',
                textAlign: TextAlign.left, // Выравниваем текст по центру
              ),
            ),
        ]
        )
      )
    );
  }
}