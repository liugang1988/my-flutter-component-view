import 'package:flutter/material.dart';

class SlideCountdownDemo extends StatelessWidget {
  const SlideCountdownDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _DigitBox(value: '0'),
        _DigitBox(value: '5'),
        Text(' : ', style: TextStyle(fontSize: 28)),
        _DigitBox(value: '2'),
        _DigitBox(value: '9'),
      ],
    );
  }
}

class _DigitBox extends StatelessWidget {
  const _DigitBox({required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(value, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
