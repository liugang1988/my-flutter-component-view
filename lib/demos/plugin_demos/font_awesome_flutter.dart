import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontAwesomeFlutterDemo extends StatelessWidget {
  const FontAwesomeFlutterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    const icons = [
      FontAwesomeIcons.github,
      FontAwesomeIcons.flutter,
      FontAwesomeIcons.apple,
      FontAwesomeIcons.android,
      FontAwesomeIcons.fire,
    ];
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        for (final icon in icons) FaIcon(icon, size: 34, color: color),
      ],
    );
  }
}
