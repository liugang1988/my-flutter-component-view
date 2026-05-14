import 'dart:math';

import 'package:flutter/material.dart';

class NumberPickerDemo extends StatefulWidget {
  const NumberPickerDemo({super.key});

  @override
  State<NumberPickerDemo> createState() => _NumberPickerDemoState();
}

class _NumberPickerDemoState extends State<NumberPickerDemo> {
  int _value = 3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: () => setState(() => _value = max(0, _value - 1)),
          icon: const Icon(Icons.remove),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            '$_value',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        IconButton.filled(
          onPressed: () => setState(() => _value++),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
