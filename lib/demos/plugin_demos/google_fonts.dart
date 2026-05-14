import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsDemo extends StatelessWidget {
  const GoogleFontsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Google Fonts 字体渲染',
          style: GoogleFonts.notoSansSc(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text('快速切换字体、字重和排版风格。', style: GoogleFonts.notoSansSc()),
      ],
    );
  }
}
