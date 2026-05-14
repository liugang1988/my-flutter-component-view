import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleSwitchDemo extends StatefulWidget {
  const ToggleSwitchDemo({super.key});

  @override
  State<ToggleSwitchDemo> createState() => _ToggleSwitchDemoState();
}

class _ToggleSwitchDemoState extends State<ToggleSwitchDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleSwitch(
        initialLabelIndex: _index,
        totalSwitches: 3,
        labels: const ['设计', '开发', '测试'],
        icons: const [Icons.brush, Icons.code, Icons.science],
        onToggle: (index) => setState(() => _index = index ?? 0),
      ),
    );
  }
}
