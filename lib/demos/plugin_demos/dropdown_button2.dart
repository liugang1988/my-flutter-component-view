import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownButton2Demo extends StatefulWidget {
  const DropdownButton2Demo({super.key});

  @override
  State<DropdownButton2Demo> createState() => _DropdownButton2DemoState();
}

class _DropdownButton2DemoState extends State<DropdownButton2Demo> {
  String _value = '动画';
  final _items = ['动画', '表单', '导航', '图片'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        value: _value,
        items: _items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: (value) => setState(() => _value = value ?? _value),
        buttonStyleData: ButtonStyleData(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
        ),
      ),
    );
  }
}
