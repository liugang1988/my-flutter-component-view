import 'package:flutter/material.dart';

class InfiniteScrollPaginationDemo extends StatelessWidget {
  const InfiniteScrollPaginationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          final loading = index == 7;
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(loading ? '加载下一页...' : '分页数据项 ${index + 1}'),
            trailing: loading
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : null,
          );
        },
      ),
    );
  }
}
