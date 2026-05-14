import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAnimationDemo extends StatelessWidget {
  const ShimmerAnimationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          for (final width in [1.0, 0.72, 0.88, 0.52])
            FractionallySizedBox(
              widthFactor: width,
              alignment: Alignment.centerLeft,
              child: Container(
                height: 18,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
