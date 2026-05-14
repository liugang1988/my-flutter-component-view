import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FlameDemo extends StatelessWidget {
  const FlameDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: GameWidget(game: _BouncingDotGame()),
      ),
    );
  }
}

class _BouncingDotGame extends FlameGame {
  late final CircleComponent _dot;
  final Vector2 _velocity = Vector2(90, 70);

  @override
  Future<void> onLoad() async {
    camera.viewfinder.visibleGameSize = Vector2(320, 220);
    _dot = CircleComponent(
      radius: 16,
      position: Vector2(80, 80),
      paint: Paint()..color = Colors.teal,
    );
    add(_dot);
    add(
      TextComponent(
        text: 'FlameGame + GameWidget',
        position: Vector2(16, 18),
        textRenderer: TextPaint(
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      Paint()..color = const Color(0xFF12312F),
    );
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _dot.position += _velocity * dt;
    final width = math.max(size.x, 1);
    final height = math.max(size.y, 1);
    if (_dot.x <= 0 || _dot.x + _dot.width >= width) {
      _velocity.x *= -1;
    }
    if (_dot.y <= 0 || _dot.y + _dot.height >= height) {
      _velocity.y *= -1;
    }
  }
}
