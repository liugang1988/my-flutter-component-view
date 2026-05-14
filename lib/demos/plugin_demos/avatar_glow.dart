import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AvatarGlowDemo extends StatelessWidget {
  const AvatarGlowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child:
          Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withValues(alpha: 0.14),
                ),
                child: Center(
                  child: Container(
                    width: 82,
                    height: 82,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.withValues(alpha: 0.28),
                    ),
                    child: const CircleAvatar(
                      radius: 28,
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scale(
                begin: const Offset(0.92, 0.92),
                end: const Offset(1.06, 1.06),
              ),
    );
  }
}
