import 'package:flutter/material.dart';

class GroupButtonDemo extends StatefulWidget {
  const GroupButtonDemo({super.key});

  @override
  State<GroupButtonDemo> createState() => _GroupButtonDemoState();
}

class _GroupButtonDemoState extends State<GroupButtonDemo> {
  final Set<String> _selected = {'UI'};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: ['UI', '动画', '表单', '图表'].map((item) {
        final selected = _selected.contains(item);
        return FilterChip(
          selected: selected,
          label: Text(item),
          onSelected: (value) => setState(() {
            value ? _selected.add(item) : _selected.remove(item);
          }),
        );
      }).toList(),
    );
  }
}
