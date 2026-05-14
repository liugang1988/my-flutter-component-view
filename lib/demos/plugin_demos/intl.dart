import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'generic_demo.dart';

class IntlDemo extends StatelessWidget {
  const IntlDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime(2026, 5, 7, 16, 30);
    final date = DateFormat.yMMMMEEEEd('zh_CN').format(now);
    final money = NumberFormat.currency(
      locale: 'zh_CN',
      symbol: '¥',
    ).format(12999.8);
    return DemoPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('日期格式化：$date'),
          const SizedBox(height: 8),
          Text('货币格式化：$money'),
        ],
      ),
    );
  }
}
