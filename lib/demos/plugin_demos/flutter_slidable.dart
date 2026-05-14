import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FlutterSlidableDemo extends StatelessWidget {
  const FlutterSlidableDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey('slidable-demo'),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: '归档',
          ),
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: '删除',
          ),
        ],
      ),
      child: const ListTile(
        leading: CircleAvatar(child: Icon(Icons.mail)),
        title: Text('向左滑动这一行'),
        subtitle: Text('展示 flutter_slidable 的侧滑操作'),
      ),
    );
  }
}
