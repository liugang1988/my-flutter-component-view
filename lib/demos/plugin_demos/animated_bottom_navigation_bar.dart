import 'package:flutter/material.dart';

class AnimatedBottomNavigationBarDemo extends StatefulWidget {
  const AnimatedBottomNavigationBarDemo({super.key});

  @override
  State<AnimatedBottomNavigationBarDemo> createState() =>
      _AnimatedBottomNavigationBarDemoState();
}

class _AnimatedBottomNavigationBarDemoState
    extends State<AnimatedBottomNavigationBarDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (index) => setState(() => _index = index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: '发现'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
      ],
    );
  }
}
