import 'package:flutter/material.dart';

import 'generic_demo.dart';

class FlutterMarkdownPlusDemo extends StatelessWidget {
  const FlutterMarkdownPlusDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('# 插件文档', style: TextStyle(fontFamily: 'monospace')),
          Text('- 支持标题、列表、代码块'),
          Divider(),
          Text(
            '插件文档',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          Text('• 支持标题、列表、代码块'),
        ],
      ),
    );
  }
}
