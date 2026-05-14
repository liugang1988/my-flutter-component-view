import 'package:flutter/material.dart';

class FlutterQuillDemo extends StatelessWidget {
  const FlutterQuillDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleButtons(
          isSelected: const [true, false, false],
          onPressed: (_) {},
          children: const [
            Icon(Icons.format_bold),
            Icon(Icons.format_italic),
            Icon(Icons.format_list_bulleted),
          ],
        ),
        const SizedBox(height: 10),
        const TextField(
          maxLines: 4,
          decoration: InputDecoration(hintText: '富文本编辑区域'),
        ),
      ],
    );
  }
}
