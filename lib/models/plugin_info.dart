import 'package:flutter/material.dart';

enum PluginCategory {
  all('全部', Icons.apps),
  visual('视觉组件', Icons.widgets),
  animation('动效交互', Icons.auto_awesome_motion),
  input('输入表单', Icons.edit_note),
  navigation('导航弹层', Icons.alt_route),
  media('图片媒体', Icons.image),
  layout('布局响应', Icons.dashboard_customize),
  feedback('反馈提示', Icons.notifications_active),
  platform('平台交互', Icons.devices),
  designSystem('设计系统', Icons.palette),
  developer('开发辅助', Icons.construction);

  const PluginCategory(this.label, this.icon);

  final String label;
  final IconData icon;
}

enum DemoKind {
  interactive('可交互 Demo', Icons.touch_app),
  visual('可视化示例', Icons.visibility),
  tutorial('接入教程', Icons.menu_book),
  platform('平台能力', Icons.devices),
  devTool('开发期工具', Icons.build);

  const DemoKind(this.label, this.icon);

  final String label;
  final IconData icon;
}

class PluginInfo {
  const PluginInfo({
    required this.rank,
    required this.name,
    required this.description,
    required this.category,
    required this.demoKind,
    required this.tags,
  });

  final int rank;
  final String name;
  final String description;
  final PluginCategory category;
  final DemoKind demoKind;
  final List<String> tags;

  String get pubUrl => 'https://pub.dev/packages/$name';
  String get installCommand => 'flutter pub add $name';

  bool matches(String query) {
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) {
      return true;
    }

    return name.toLowerCase().contains(normalized) ||
        description.toLowerCase().contains(normalized) ||
        category.label.toLowerCase().contains(normalized) ||
        tags.any((tag) => tag.toLowerCase().contains(normalized));
  }
}
