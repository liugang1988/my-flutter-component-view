import 'package:flutter/material.dart';

class FlutterTiltDemo extends StatefulWidget {
  const FlutterTiltDemo({super.key});

  @override
  State<FlutterTiltDemo> createState() => _FlutterTiltDemoState();
}

class _FlutterTiltDemoState extends State<FlutterTiltDemo> {
  double _turn = -0.04;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.rotate(
          angle: _turn,
          child: Container(
            height: 120,
            width: 190,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Tilt Card',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        Slider(
          value: _turn,
          min: -0.18,
          max: 0.18,
          onChanged: (value) => setState(() => _turn = value),
        ),
      ],
    );
  }
}
