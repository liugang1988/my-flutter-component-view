import 'package:flutter/material.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class WechatCameraPickerDemo extends StatelessWidget {
  const WechatCameraPickerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('CameraPicker opens the camera on supported platforms.'),
        const SizedBox(height: 10),
        FilledButton.icon(
          onPressed: () async {
            final entity = await CameraPicker.pickFromCamera(context);
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(entity == null ? 'No capture' : 'Captured media'),
                ),
              );
            }
          },
          icon: const Icon(Icons.photo_camera),
          label: const Text('Open camera picker'),
        ),
      ],
    );
  }
}
