import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedBorderDemo extends StatelessWidget {
  const DottedBorderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: const Radius.circular(8),
        color: Theme.of(context).colorScheme.primary,
        strokeWidth: 2,
        dashPattern: const [9, 6],
      ),
      child: const SizedBox(
        height: 150,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_upload, size: 42),
            SizedBox(height: 8),
            Text('真实 dotted_border 上传区域'),
          ],
        ),
      ),
    );
  }
}
