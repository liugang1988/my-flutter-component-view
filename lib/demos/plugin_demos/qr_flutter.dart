import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrFlutterDemo extends StatelessWidget {
  const QrFlutterDemo({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImageView(
        data: 'https://pub.dev/packages/$label',
        version: QrVersions.auto,
        size: 180,
        backgroundColor: Colors.white,
      ),
    );
  }
}
