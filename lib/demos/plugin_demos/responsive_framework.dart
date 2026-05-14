import 'package:flutter/material.dart';

class ResponsiveFrameworkDemo extends StatelessWidget {
  const ResponsiveFrameworkDemo({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 420;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$name 根据宽度切换布局：${compact ? '紧凑' : '宽屏'}'),
            const SizedBox(height: 12),
            Flex(
              direction: compact ? Axis.vertical : Axis.horizontal,
              children: [
                _Box(compact: compact, text: 'A', color: Colors.tealAccent),
                const SizedBox(width: 8, height: 8),
                _Box(compact: compact, text: 'B', color: Colors.amberAccent),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({required this.compact, required this.text, required this.color});

  final bool compact;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      height: 74,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text),
    );
    return compact ? child : Expanded(child: child);
  }
}
