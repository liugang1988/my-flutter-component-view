import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class BlurDemo extends StatefulWidget {
  const BlurDemo({super.key});

  @override
  State<BlurDemo> createState() => _BlurDemoState();
}

class _BlurDemoState extends State<BlurDemo> {
  double _value = 4;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 170,
          child: Stack(
            fit: StackFit.expand,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [
                      colors.tertiaryContainer,
                      colors.primaryContainer,
                      colors.secondaryContainer,
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 150,
                  height: 86,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ).blurred(
                  blur: _value,
                  borderRadius: BorderRadius.circular(8),
                  colorOpacity: 0.12,
                ),
              ),
              const Center(
                child: Text(
                  'blurred() extension',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: _value,
          min: 0,
          max: 10,
          divisions: 10,
          label: _value.toStringAsFixed(0),
          onChanged: (value) => setState(() => _value = value),
        ),
      ],
    );
  }
}
