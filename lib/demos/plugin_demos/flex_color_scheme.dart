import 'package:flutter/material.dart';

class FlexColorSchemeDemo extends StatefulWidget {
  const FlexColorSchemeDemo({super.key});

  @override
  State<FlexColorSchemeDemo> createState() => _FlexColorSchemeDemoState();
}

class _FlexColorSchemeDemoState extends State<FlexColorSchemeDemo> {
  int _index = 0;

  final _schemes = const [
    (name: 'Teal', color: Colors.teal),
    (name: 'Indigo', color: Colors.indigo),
    (name: 'Rose', color: Colors.pink),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = _schemes[_index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SegmentedButton<int>(
          segments: [
            for (var i = 0; i < _schemes.length; i++)
              ButtonSegment(value: i, label: Text(_schemes[i].name)),
          ],
          selected: {_index},
          onSelectionChanged: (value) => setState(() => _index = value.first),
        ),
        const SizedBox(height: 12),
        Container(
          height: 110,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: scheme.color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${scheme.name} 主题预览',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
