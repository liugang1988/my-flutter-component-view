import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/plugin_info.dart';

class DemoPanel extends StatelessWidget {
  const DemoPanel({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}

class InfoDemo extends StatelessWidget {
  const InfoDemo({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DemoPanel(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BestPracticeDemo extends StatelessWidget {
  const BestPracticeDemo({super.key, required this.plugin});

  final PluginInfo plugin;

  bool get _isExperienceFirst =>
      plugin.demoKind == DemoKind.interactive ||
      plugin.demoKind == DemoKind.visual ||
      plugin.category == PluginCategory.visual ||
      plugin.category == PluginCategory.animation ||
      plugin.category == PluginCategory.input ||
      plugin.category == PluginCategory.navigation ||
      plugin.category == PluginCategory.layout ||
      plugin.category == PluginCategory.feedback ||
      plugin.category == PluginCategory.media ||
      plugin.category == PluginCategory.designSystem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return DemoPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                _isExperienceFirst ? Icons.touch_app : plugin.demoKind.icon,
                color: colors.primary,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plugin.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(_summary),
                  ],
                ),
              ),
            ],
          ),
          if (_isExperienceFirst) ...[
            const SizedBox(height: 12),
            _VisualPracticePreview(plugin: plugin),
          ],
          const SizedBox(height: 12),
          _BestPracticeCodeBlock(code: _bestPracticeCode),
        ],
      ),
    );
  }

  String get _summary {
    if (_isExperienceFirst) {
      return '优先使用 pub.dev Example 或插件真实 API 做可体验演示；当前依赖不可直接运行时，先放入可迁移的最小接入代码。';
    }
    if (plugin.demoKind == DemoKind.platform) {
      return '该能力依赖目标平台、权限或原生配置；Demo 区展示推荐接入方式和失败态处理代码。';
    }
    return '该插件更适合通过构建、生成、架构或服务端流程体现价值；Demo 区展示推荐项目接入代码。';
  }

  String get _bestPracticeCode {
    final className = _className(plugin.name);
    switch (plugin.demoKind) {
      case DemoKind.platform:
        return "import 'package:flutter/material.dart';\n"
            "import 'package:${plugin.name}/${plugin.name}.dart';\n\n"
            "class ${className}EntryPoint extends StatefulWidget {\n"
            "  const ${className}EntryPoint({super.key});\n\n"
            "  @override\n"
            "  State<${className}EntryPoint> createState() => _${className}EntryPointState();\n"
            "}\n\n"
            "class _${className}EntryPointState extends State<${className}EntryPoint> {\n"
            "  Object? lastError;\n\n"
            "  Future<void> run() async {\n"
            "    try {\n"
            "      // Check platform support, request permissions, then call ${plugin.name} APIs.\n"
            "    } catch (error) {\n"
            "      setState(() => lastError = error);\n"
            "    }\n"
            "  }\n\n"
            "  @override\n"
            "  Widget build(BuildContext context) {\n"
            "    return FilledButton.icon(\n"
            "      onPressed: run,\n"
            "      icon: const Icon(Icons.play_arrow),\n"
            "      label: const Text('Run platform capability'),\n"
            "    );\n"
            "  }\n"
            "}\n";
      case DemoKind.devTool:
      case DemoKind.tutorial:
        return "dependencies:\n"
            "  ${plugin.name}: any\n\n"
            "# Then follow the package README / pub.dev Example.\n"
            "# Keep generated code out of hand-written widgets and commit config files.\n"
            "${plugin.installCommand}\n";
      case DemoKind.interactive:
      case DemoKind.visual:
        return "import 'package:flutter/material.dart';\n"
            "import 'package:${plugin.name}/${plugin.name}.dart';\n\n"
            "class ${className}Demo extends StatelessWidget {\n"
            "  const ${className}Demo({super.key});\n\n"
            "  @override\n"
            "  Widget build(BuildContext context) {\n"
            "    // Prefer the official pub.dev Example. If the package has no runnable\n"
            "    // Example, keep this widget as the smallest visible ${plugin.name} use case.\n"
            "    return const SizedBox(\n"
            "      height: 160,\n"
            "      child: Center(child: Text('${plugin.name} demo')),\n"
            "    );\n"
            "  }\n"
            "}\n";
    }
  }
}

class _VisualPracticePreview extends StatelessWidget {
  const _VisualPracticePreview({required this.plugin});

  final PluginInfo plugin;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: 132,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 92,
              height: double.infinity,
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(8),
                ),
              ),
              child: Icon(
                plugin.category.icon,
                color: colors.onPrimaryContainer,
              ),
            ),
          ),
          Positioned.fill(
            left: 108,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    plugin.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: 0.72,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BestPracticeCodeBlock extends StatelessWidget {
  const _BestPracticeCodeBlock({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: SelectableText(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 12,
          height: 1.35,
        ),
      ),
    );
  }
}

class PlatformCapabilityDemo extends StatelessWidget {
  const PlatformCapabilityDemo({super.key, required this.plugin});

  final PluginInfo plugin;

  @override
  Widget build(BuildContext context) {
    return BestPracticeDemo(plugin: plugin);
  }
}

class DevConceptDemo extends StatelessWidget {
  const DevConceptDemo({super.key, required this.plugin});

  final PluginInfo plugin;

  @override
  Widget build(BuildContext context) {
    return BestPracticeDemo(plugin: plugin);
  }
}

class StateManagementDemo extends StatefulWidget {
  const StateManagementDemo({super.key, required this.name});

  final String name;

  @override
  State<StateManagementDemo> createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${widget.name} 状态示例：$_count',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        IconButton.filledTonal(
          onPressed: () => setState(() => _count = max(0, _count - 1)),
          icon: const Icon(Icons.remove),
        ),
        const SizedBox(width: 8),
        IconButton.filled(
          onPressed: () => setState(() => _count += 1),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class FallbackSpecificDemo extends StatelessWidget {
  const FallbackSpecificDemo({super.key, required this.plugin});

  final PluginInfo plugin;

  @override
  Widget build(BuildContext context) {
    return BestPracticeDemo(plugin: plugin);
  }
}

String _className(String packageName) {
  return packageName
      .split('_')
      .where((part) => part.isNotEmpty)
      .map((part) => part[0].toUpperCase() + part.substring(1))
      .join();
}
