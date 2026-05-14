import 'package:flutter/material.dart';

class ExpandablePageViewDemo extends StatelessWidget {
  const ExpandablePageViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 176,
      child: PageView(
        children: const [
          _ColorPage(color: Colors.teal, text: '短内容 Page'),
          _ColorPage(color: Colors.indigo, text: '高度自适应 PageView 示意'),
        ],
      ),
    );
  }
}

class _ColorPage extends StatelessWidget {
  const _ColorPage({required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
