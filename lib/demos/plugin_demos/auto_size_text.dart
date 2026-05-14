import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeTextDemo extends StatelessWidget {
  const AutoSizeTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const AutoSizeText(
        'This title fits inside a small card',
        maxLines: 1,
        minFontSize: 8,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
      ),
    );
  }
}
