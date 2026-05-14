import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlutterSvgDemo extends StatelessWidget {
  const FlutterSvgDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    const svg = '''
<svg width="160" height="110" viewBox="0 0 160 110" xmlns="http://www.w3.org/2000/svg">
  <rect x="12" y="18" width="136" height="74" rx="14" fill="#E7F4F2"/>
  <path d="M44 70L68 42L87 62L102 49L124 70H44Z" fill="#0B6E69"/>
  <circle cx="111" cy="35" r="9" fill="#F2B84B"/>
</svg>
''';
    return Center(
      child: Column(
        children: [
          SvgPicture.string(svg, width: 180),
          const SizedBox(height: 8),
          Text('真实使用 SvgPicture.string 渲染矢量图', style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
