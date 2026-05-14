import 'package:flutter/material.dart';

class OctoImageDemo extends StatelessWidget {
  const OctoImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 116,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [Colors.teal.shade100, Colors.teal.shade300],
            ),
          ),
          child: const Center(
            child: Icon(Icons.image, size: 48, color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        const LinearProgressIndicator(value: 1),
        const SizedBox(height: 6),
        const Text('图片加载完成，错误态和占位态统一管理'),
      ],
    );
  }
}
