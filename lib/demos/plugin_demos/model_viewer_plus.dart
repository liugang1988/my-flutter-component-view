import 'package:flutter/material.dart';

class ModelViewerPlusDemo extends StatelessWidget {
  const ModelViewerPlusDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: CustomPaint(
        painter: _CubePainter(Theme.of(context).colorScheme.primary),
        child: const Center(child: Text('3D 模型预览')),
      ),
    );
  }
}

class _CubePainter extends CustomPainter {
  _CubePainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final front = Rect.fromCenter(center: center, width: 96, height: 70);
    final back = front.translate(28, -24);
    final linePaint = Paint()
      ..color = color
      ..strokeWidth = 2;
    canvas.drawRect(back, Paint()..color = color.withValues(alpha: 0.18));
    canvas.drawRect(front, Paint()..color = color.withValues(alpha: 0.32));
    canvas.drawLine(front.topLeft, back.topLeft, linePaint);
    canvas.drawLine(front.topRight, back.topRight, linePaint);
    canvas.drawLine(front.bottomRight, back.bottomRight, linePaint);
  }

  @override
  bool shouldRepaint(covariant _CubePainter oldDelegate) => false;
}
