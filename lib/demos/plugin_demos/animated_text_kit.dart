import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextKitDemo extends StatelessWidget {
  const AnimatedTextKitDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w800,
        color: Theme.of(context).colorScheme.primary,
      ),
      child: AnimatedTextKit(
        repeatForever: true,
        pause: const Duration(milliseconds: 700),
        animatedTexts: [
          TypewriterAnimatedText('animated_text_kit'),
          FadeAnimatedText('文字动效集合'),
          ScaleAnimatedText('可直接运行'),
        ],
      ),
    );
  }
}
