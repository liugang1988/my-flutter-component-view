import 'package:flutter/material.dart';

class FlutterFormBuilderDemo extends StatelessWidget {
  const FlutterFormBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextField(decoration: InputDecoration(labelText: '姓名')),
        SizedBox(height: 10),
        TextField(decoration: InputDecoration(labelText: '邮箱')),
      ],
    );
  }
}
