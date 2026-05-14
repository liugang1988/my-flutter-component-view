import 'package:flutter/material.dart';

class AnimatedFlipCounterDemo extends StatefulWidget {
  const AnimatedFlipCounterDemo({super.key});

  @override
  State<AnimatedFlipCounterDemo> createState() =>
      _AnimatedFlipCounterDemoState();
}

class _AnimatedFlipCounterDemoState extends State<AnimatedFlipCounterDemo> {
  int _value = 128;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(end: _value.toDouble()),
          duration: const Duration(milliseconds: 450),
          builder: (context, value, _) => Text(
            value.round().toString(),
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const SizedBox(width: 16),
        FilledButton(
          onPressed: () => setState(() => _value += 7),
          child: const Text('+7'),
        ),
      ],
    );
  }
}
