import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FlutterAnimateDemo extends StatelessWidget {
  const FlutterAnimateDemo({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Container(
                width: 132,
                height: 132,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .fade(duration: 600.ms)
              .scale(begin: const Offset(0.88, 0.88), end: const Offset(1, 1)),
    );
  }
}
