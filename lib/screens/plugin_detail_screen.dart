import 'package:flutter/material.dart';

import '../demos/plugin_demo_host.dart';
import '../models/plugin_info.dart';

class PluginDetailScreen extends StatelessWidget {
  const PluginDetailScreen({super.key, required this.plugin});

  final PluginInfo plugin;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(title: Text(plugin.name)),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: colorScheme.primaryContainer,
                            child: Text(
                              '#${plugin.rank}',
                              style: textTheme.labelLarge?.copyWith(
                                color: colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  plugin.name,
                                  style: textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(plugin.pubUrl),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(plugin.description),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          Chip(
                            avatar: Icon(plugin.category.icon, size: 18),
                            label: Text(plugin.category.label),
                          ),
                          Chip(
                            avatar: Icon(plugin.demoKind.icon, size: 18),
                            label: Text(plugin.demoKind.label),
                          ),
                          ...plugin.tags.map((item) => Chip(label: Text(item))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: 'Demo 预览',
                child: PluginDemoHost(plugin: plugin),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: '安装命令',
                child: CodeBlock(code: plugin.installCommand),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: '接入要点',
                child: _Guide(plugin: plugin),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: '最小示例',
                child: CodeBlock(code: _exampleFor(plugin)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Guide extends StatelessWidget {
  const _Guide({required this.plugin});

  final PluginInfo plugin;

  @override
  Widget build(BuildContext context) {
    final steps = [
      '先用 `${plugin.installCommand}` 安装包，并运行 `flutter pub get`。',
      '阅读 pub.dev 包页的平台支持、权限和初始化说明。',
      '把最小示例放进独立 Widget 验证，再接入业务页面。',
      '涉及相机、分享、WebView、桌面小组件等能力时，优先在真机或目标平台验证失败态。',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var index = 0; index < steps.length; index++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 12, child: Text('${index + 1}')),
                const SizedBox(width: 10),
                Expanded(child: Text(steps[index])),
              ],
            ),
          ),
      ],
    );
  }
}

String _exampleFor(PluginInfo plugin) {
  return "import 'package:${plugin.name}/${plugin.name}.dart';\n\n"
      "class ${_className(plugin.name)}Demo extends StatelessWidget {\n"
      "  const ${_className(plugin.name)}Demo({super.key});\n\n"
      "  @override\n"
      "  Widget build(BuildContext context) {\n"
      "    return const Text('在这里接入 ${plugin.name} 的官方最小示例');\n"
      "  }\n"
      "}\n";
}

String _className(String packageName) {
  return packageName
      .split('_')
      .where((part) => part.isNotEmpty)
      .map((part) => part[0].toUpperCase() + part.substring(1))
      .join();
}

class SectionCard extends StatelessWidget {
  const SectionCard({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class CodeBlock extends StatelessWidget {
  const CodeBlock({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SelectableText(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 13,
          height: 1.35,
        ),
      ),
    );
  }
}
