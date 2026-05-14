import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class BlurrycontainerDemo extends StatelessWidget {
  const BlurrycontainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    colors.primaryContainer,
                    colors.tertiaryContainer,
                    colors.secondaryContainer,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 18,
            top: 20,
            child: Icon(Icons.auto_awesome, size: 72, color: colors.primary),
          ),
          Center(
            child: BlurryContainer(
              blur: 8,
              elevation: 2,
              color: colors.surface.withValues(alpha: 0.52),
              borderRadius: BorderRadius.circular(8),
              padding: const EdgeInsets.all(18),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.layers),
                  SizedBox(height: 8),
                  Text('Glass panel with BlurryContainer'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
