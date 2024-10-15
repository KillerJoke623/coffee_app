import 'package:flutter/material.dart';
import 'cart.dart';

class OrderScreen extends StatefulWidget {
  final Cart cart;

  const OrderScreen({super.key, required this.cart});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String? _selectedDeliveryMethod;
  final _addressController = TextEditingController();
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Оформление заказа'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Способ получения:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedDeliveryMethod,
              hint: const Text('Выберите способ'),
              items: const [
                DropdownMenuItem(
                  value: 'delivery',
                  child: Text('Доставка'),
                ),
                DropdownMenuItem(
                  value: 'pickup',
                  child: Text('Самовывоз'),
                ),
              ],
              onChanged: (method) {
                setState(() {
                  _selectedDeliveryMethod = method;
                });
              },
            ),
            if (_selectedDeliveryMethod == 'delivery') ...[
              const SizedBox(height: 16),
              const Text(
                'Адрес доставки:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  hintText: 'Введите адрес',
                ),
              ),
            ],
            const SizedBox(height: 16),
            const Text(
              'Способ оплаты:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedPaymentMethod,
              hint: const Text('Выберите способ'),
              items: const [
                DropdownMenuItem(
                  value: 'card',
                  child: Text('Картой'),
                ),
                DropdownMenuItem(
                  value: 'cash',
                  child: Text('Наличными'),
                ),
              ],
              onChanged: (method) {
                setState(() {
                  _selectedPaymentMethod = method;
                });
              },
            ),
            const Spacer(), // Растягиваем пространство между элементами
            ElevatedButton(
              onPressed: () {
                // TODO: Обработка подтверждения заказа
              },
              child: const Text('Подтвердить заказ'),
            ),
          ],
        ),
      ),
    );
  }
}