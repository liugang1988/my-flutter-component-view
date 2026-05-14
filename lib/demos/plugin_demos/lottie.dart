import 'package:flutter/material.dart';

class LottieDemo extends StatelessWidget {
  const LottieDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Lottie 动画\n需提供 json 资产',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
