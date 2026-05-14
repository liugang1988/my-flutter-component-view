import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class WechatAssetsPickerDemo extends StatelessWidget {
  const WechatAssetsPickerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('AssetPicker opens the platform gallery after permissions are granted.'),
        const SizedBox(height: 10),
        FilledButton.icon(
          onPressed: () async {
            final assets = await AssetPicker.pickAssets(
              context,
              pickerConfig: const AssetPickerConfig(maxAssets: 3),
            );
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected ${assets?.length ?? 0} assets')),
              );
            }
          },
          icon: const Icon(Icons.photo_library),
          label: const Text('Open asset picker'),
        ),
      ],
    );
  }
}
