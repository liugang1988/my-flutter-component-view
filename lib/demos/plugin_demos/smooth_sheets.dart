import 'package:flutter/material.dart';

class SmoothSheetsDemo extends StatelessWidget {
  const SmoothSheetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          showDragHandle: true,
          builder: (context) => const Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '可拖拽 Sheet',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 8),
                Text('用于筛选器、详情和流程步骤。'),
              ],
            ),
          ),
        );
      },
      icon: const Icon(Icons.vertical_align_top),
      label: const Text('打开底部 Sheet'),
    );
  }
}
