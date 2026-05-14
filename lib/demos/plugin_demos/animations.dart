import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AnimationsDemo extends StatelessWidget {
  const AnimationsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        OpenContainer<void>(
          closedElevation: 0,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          closedBuilder: (context, openContainer) => InkWell(
            onTap: openContainer,
            borderRadius: BorderRadius.circular(8),
            child: const SizedBox(
              width: 180,
              height: 86,
              child: Center(child: Text('OpenContainer')),
            ),
          ),
          openBuilder: (context, closeContainer) => Scaffold(
            appBar: AppBar(title: const Text('Container transform')),
            body: Center(
              child: FilledButton(
                onPressed: closeContainer,
                child: const Text('Close'),
              ),
            ),
          ),
        ),
        PageTransitionSwitcher(
          duration: const Duration(milliseconds: 450),
          transitionBuilder: (child, animation, secondaryAnimation) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: const SizedBox(
            key: ValueKey('shared-axis-preview'),
            width: 180,
            height: 86,
            child: Card(
              child: Center(child: Text('SharedAxisTransition')),
            ),
          ),
        ),
      ],
    );
  }
}
