import 'package:flutter/material.dart';

class WidgetsToImageDemo extends StatelessWidget {
  const WidgetsToImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text('待导出的 Widget'),
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.camera_alt), SizedBox(width: 8), Text('捕获为图片')],
        ),
      ],
    );
  }
}
