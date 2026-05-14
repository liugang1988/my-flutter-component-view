import 'package:flutter/material.dart';

import 'generic_demo.dart';

class LocationDemo extends StatelessWidget {
  const LocationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoDemo(
      icon: Icons.extension,
      title: 'location',
      body:
          'location 的独立 Demo 文件。该插件在当前环境中使用可运行的功能模拟、接入流程或平台说明展示；如后续引入真实依赖，可在本文件内升级为真实 API 调用。',
    );
  }
}
