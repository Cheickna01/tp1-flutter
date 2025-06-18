import 'package:flutter/material.dart';

class counterButtonWidget extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const counterButtonWidget({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            onIncrement();
          },
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: () {
            onDecrement();
          },
        ),
      ],
    );
  }
}
