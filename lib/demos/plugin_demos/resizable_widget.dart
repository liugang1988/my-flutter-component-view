import 'package:flutter/material.dart';

class ResizableWidgetDemo extends StatefulWidget {
  const ResizableWidgetDemo({super.key});

  @override
  State<ResizableWidgetDemo> createState() => _ResizableWidgetDemoState();
}

class _ResizableWidgetDemoState extends State<ResizableWidgetDemo> {
  double _ratio = 0.44;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          child: Row(
            children: [
              Expanded(
                flex: (_ratio * 100).round(),
                child: const _Pane(label: '左面板', color: Colors.tealAccent),
              ),
              const VerticalDivider(width: 8),
              Expanded(
                flex: ((1 - _ratio) * 100).round(),
                child: const _Pane(label: '右面板', color: Colors.amberAccent),
              ),
            ],
          ),
        ),
        Slider(
          value: _ratio,
          onChanged: (value) => setState(() => _ratio = value),
        ),
      ],
    );
  }
}

class _Pane extends StatelessWidget {
  const _Pane({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label),
    );
  }
}
