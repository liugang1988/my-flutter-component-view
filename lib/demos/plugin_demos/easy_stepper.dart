import 'package:flutter/material.dart';

class EasyStepperDemo extends StatelessWidget {
  const EasyStepperDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Row(
      children: [
        for (var i = 0; i < 3; i++) ...[
          CircleAvatar(
            backgroundColor: color,
            child: Text(
              '${i + 1}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          if (i < 2) Expanded(child: Divider(color: color, thickness: 2)),
        ],
      ],
    );
  }
}
