import 'package:flutter/material.dart';

import '../models/plugin_info.dart';
import 'plugin_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.plugins});

  final List<PluginInfo> plugins;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PluginCategory _selectedCategory = PluginCategory.all;
  String _query = '';

  List<PluginInfo> get _filteredPlugins {
    return widget.plugins.where((plugin) {
      final categoryMatched =
          _selectedCategory == PluginCategory.all ||
          plugin.category == _selectedCategory;
      return categoryMatched && plugin.matches(_query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredPlugins;

    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('pub.dev 热门 UI 交互插件')),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _Header(
                  totalCount: widget.plugins.length,
                  visibleCount: filtered.length,
                  onSearchChanged: (value) => setState(() => _query = value),
                ),
              ),
              SliverToBoxAdapter(
                child: _CategoryFilter(
                  selectedCategory: _selectedCategory,
                  onSelected: (category) {
                    setState(() => _selectedCategory = category);
                  },
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                sliver: filtered.isEmpty
                    ? const SliverToBoxAdapter(child: _EmptyState())
                    : SliverLayoutBuilder(
                        builder: (context, constraints) {
                          final width = constraints.crossAxisExtent;
                          final crossAxisCount = width >= 1080
                              ? 3
                              : width >= 700
                              ? 2
                              : 1;
                          return SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  mainAxisExtent: 174,
                                ),
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final plugin = filtered[index];
                              return PluginCard(
                                plugin: plugin,
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (_) =>
                                        PluginDetailScreen(plugin: plugin),
                                  ),
                                ),
                              );
                            }, childCount: filtered.length),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.totalCount,
    required this.visibleCount,
    required this.onSearchChanged,
  });

  final int totalCount;
  final int visibleCount;
  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '热门 UI/交互 + Flutter Favorite 插件',
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '来源：2026-05-07 按 pub.dev API 的 Flutter + UI/交互关键词热门排序筛选。当前显示 $visibleCount / $totalCount 个。',
            style: textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: onSearchChanged,
            decoration: const InputDecoration(
              hintText: '搜索插件名、分类、标签或中文说明',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryFilter extends StatelessWidget {
  const _CategoryFilter({
    required this.selectedCategory,
    required this.onSelected,
  });

  final PluginCategory selectedCategory;
  final ValueChanged<PluginCategory> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
      child: Row(
        children: [
          for (final category in PluginCategory.values) ...[
            _CategoryChip(
              category: category,
              selected: selectedCategory == category,
              onTap: () => onSelected(category),
            ),
            const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.category,
    required this.selected,
    required this.onTap,
  });

  final PluginCategory category;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return FilterChip(
      selected: selected,
      avatar: Icon(category.icon, size: 18),
      label: Text(category.label),
      onSelected: (_) => onTap(),
      selectedColor: colors.primaryContainer,
      checkmarkColor: colors.onPrimaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}

class PluginCard extends StatelessWidget {
  const PluginCard({super.key, required this.plugin, required this.onTap});

  final PluginInfo plugin;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${plugin.rank}',
                        style: textTheme.labelLarge?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plugin.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          plugin.category.label,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(plugin.demoKind.icon, color: colorScheme.primary),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                plugin.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  _SmallTag(label: plugin.demoKind.label),
                  ...plugin.tags.take(2).map((item) => _SmallTag(label: item)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SmallTag extends StatelessWidget {
  const _SmallTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colors.secondaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.labelSmall?.copyWith(color: colors.onSecondaryContainer),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Center(child: Text('没有找到匹配的插件')),
      ),
    );
  }
}
