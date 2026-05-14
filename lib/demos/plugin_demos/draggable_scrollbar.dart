import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';

class DraggableScrollbarDemo extends StatefulWidget {
  const DraggableScrollbarDemo({super.key});

  @override
  State<DraggableScrollbarDemo> createState() => _DraggableScrollbarDemoState();
}

class _DraggableScrollbarDemoState extends State<DraggableScrollbarDemo> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: DraggableScrollbar.rrect(
        controller: _controller,
        alwaysVisibleScrollThumb: true,
        child: ListView.builder(
          controller: _controller,
          itemCount: 60,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(child: Text('$index')),
            title: Text('Long list row $index'),
            subtitle: const Text('Drag the scrollbar thumb to jump quickly.'),
          ),
        ),
      ),
    );
  }
}
