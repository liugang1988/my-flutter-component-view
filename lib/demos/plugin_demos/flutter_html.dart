import 'package:flutter/material.dart';

class FlutterHtmlDemo extends StatelessWidget {
  const FlutterHtmlDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('<h2>插件说明</h2><p><b>Flutter</b> 渲染富文本内容。</p>'),
        Divider(),
        Text(
          '插件说明',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Flutter',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              TextSpan(text: ' 渲染富文本内容。'),
            ],
          ),
        ),
      ],
    );
  }
}
