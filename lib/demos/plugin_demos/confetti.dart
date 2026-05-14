import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiDemo extends StatefulWidget {
  const ConfettiDemo({super.key});

  @override
  State<ConfettiDemo> createState() => _ConfettiDemoState();
}

class _ConfettiDemoState extends State<ConfettiDemo> {
  late final ConfettiController _controller = ConfettiController(
    duration: const Duration(milliseconds: 900),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ConfettiWidget(
            confettiController: _controller,
            blastDirectionality: BlastDirectionality.explosive,
            numberOfParticles: 18,
          ),
          FilledButton.icon(
            onPressed: _controller.play,
            icon: const Icon(Icons.celebration),
            label: const Text('播放礼花'),
          ),
        ],
      ),
    );
  }
}
