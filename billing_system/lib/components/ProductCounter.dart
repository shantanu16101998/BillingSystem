import 'package:flutter/material.dart';

class ProductCounter extends StatelessWidget {
  final String productName;
  final int count;
  final VoidCallback onIncrementPressed;
  final VoidCallback onDecrementPressed;

  const ProductCounter({
    super.key,
    required this.productName,
    required this.count,
    required this.onIncrementPressed,
    required this.onDecrementPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          '$productName',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        // const SizedBox(height: 16,width: 10),
        Text(
          '$count',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ),
        // const SizedBox(height: 16,width: 10),

        ElevatedButton(
          onPressed: onIncrementPressed,
          child: const Text('+'),
        ),
        // const SizedBox(height: 16,width: 10),

        ElevatedButton(
          onPressed: onDecrementPressed,
          child: const Text('-'),
        ),
      ],
    );
  }
}
