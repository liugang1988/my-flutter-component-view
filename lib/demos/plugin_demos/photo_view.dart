import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewDemo extends StatelessWidget {
  const PhotoViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: PhotoView.customChild(
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.teal, Colors.indigo]),
            ),
            child: const Center(
              child: Icon(Icons.zoom_out_map, size: 64, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
