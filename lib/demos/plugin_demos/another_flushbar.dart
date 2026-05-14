import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AnotherFlushbarDemo extends StatelessWidget {
  const AnotherFlushbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        FilledButton.icon(
          onPressed: () {
            Flushbar<void>(
              title: 'Saved',
              message: 'Flushbar can float above the current page.',
              icon: const Icon(Icons.check_circle, color: Colors.white),
              duration: const Duration(seconds: 2),
              margin: const EdgeInsets.all(12),
              borderRadius: BorderRadius.circular(8),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ).show(context);
          },
          icon: const Icon(Icons.notifications_active),
          label: const Text('Show flushbar'),
        ),
        OutlinedButton.icon(
          onPressed: () {
            Flushbar<void>(
              messageText: const Text(
                'Action flushbars can include buttons and custom content.',
                style: TextStyle(color: Colors.white),
              ),
              mainButton: TextButton(
                onPressed: () => Navigator.of(context).maybePop(),
                child: const Text('UNDO'),
              ),
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.blueGrey.shade800,
            ).show(context);
          },
          icon: const Icon(Icons.undo),
          label: const Text('Action style'),
        ),
      ],
    );
  }
}
