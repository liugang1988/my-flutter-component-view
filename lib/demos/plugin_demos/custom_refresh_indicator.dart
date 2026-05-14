import 'package:flutter/material.dart';

class CustomRefreshIndicatorDemo extends StatelessWidget {
  const CustomRefreshIndicatorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: RefreshIndicator(
        onRefresh: () async =>
            Future<void>.delayed(const Duration(milliseconds: 500)),
        child: ListView(
          children: const [
            ListTile(leading: Icon(Icons.refresh), title: Text('向下拉动触发刷新')),
            ListTile(title: Text('自定义刷新指示器通常替换这里的动效')),
          ],
        ),
      ),
    );
  }
}
