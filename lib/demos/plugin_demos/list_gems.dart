import 'package:accordion/accordion.dart';
import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../models/plugin_info.dart';
import 'generic_demo.dart';

class ScrollablePositionedListDemo extends StatefulWidget {
  const ScrollablePositionedListDemo({super.key});

  @override
  State<ScrollablePositionedListDemo> createState() =>
      _ScrollablePositionedListDemoState();
}

class _ScrollablePositionedListDemoState
    extends State<ScrollablePositionedListDemo> {
  final _controller = ItemScrollController();
  final _positions = ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            children: [
              for (final index in [0, 12, 36, 72])
                FilledButton.tonal(
                  onPressed: () => _controller.scrollTo(
                    index: index,
                    duration: const Duration(milliseconds: 450),
                    curve: Curves.easeOutCubic,
                  ),
                  child: Text('跳到 $index'),
                ),
            ],
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder<Iterable<ItemPosition>>(
            valueListenable: _positions.itemPositions,
            builder: (context, positions, _) {
              final visible = positions.map((e) => e.index).toList()..sort();
              return Text(
                visible.isEmpty
                    ? '滚动列表查看可见区间'
                    : '当前可见：${visible.first} - ${visible.last}',
              );
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ScrollablePositionedList.builder(
              itemCount: 100,
              itemScrollController: _controller,
              itemPositionsListener: _positions,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(child: Text('$index')),
                  title: Text('定位列表项 $index'),
                  subtitle: const Text('可以按 index 跳转或动画滚动到这一行。'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GroupedListDemo extends StatelessWidget {
  const GroupedListDemo({super.key});

  static const _items = [
    {'name': '设计评审', 'group': '今天'},
    {'name': '插件核对', 'group': '今天'},
    {'name': 'Demo 打磨', 'group': '明天'},
    {'name': '验收测试', 'group': '明天'},
    {'name': '发布说明', 'group': '稍后'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: GroupedListView<Map<String, String>, String>(
        elements: _items,
        groupBy: (item) => item['group']!,
        groupSeparatorBuilder: (group) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Text(
            group,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        itemBuilder: (context, item) => Card(
          child: ListTile(
            leading: const Icon(Icons.task_alt),
            title: Text(item['name']!),
            subtitle: Text('分组：${item['group']}'),
          ),
        ),
        useStickyGroupSeparators: true,
        order: GroupedListOrder.ASC,
      ),
    );
  }
}

class FlutterSwipeActionCellDemo extends StatefulWidget {
  const FlutterSwipeActionCellDemo({super.key});

  @override
  State<FlutterSwipeActionCellDemo> createState() =>
      _FlutterSwipeActionCellDemoState();
}

class _FlutterSwipeActionCellDemoState
    extends State<FlutterSwipeActionCellDemo> {
  final _controller = SwipeActionController();
  final _items = ['收件箱', '发票', '设计备注', '测试报告'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < _items.length; i++)
          SwipeActionCell(
            key: ValueKey(_items[i]),
            controller: _controller,
            index: i,
            trailingActions: [
              SwipeAction(
                title: '删除',
                color: Colors.red,
                onTap: (handler) async {
                  await handler(true);
                  setState(() => _items.removeAt(i));
                },
              ),
              SwipeAction(
                title: '更多',
                color: Colors.blueGrey,
                onTap: (handler) async => handler(false),
              ),
            ],
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.mail_outline),
                title: Text(_items[i]),
                subtitle: const Text('向左滑动显示操作按钮。'),
              ),
            ),
          ),
      ],
    );
  }
}

class AccordionListDemo extends StatelessWidget {
  const AccordionListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Accordion(
        maxOpenSections: 2,
        headerBackgroundColorOpened: Theme.of(context).colorScheme.primary,
        headerBackgroundColor: Theme.of(context).colorScheme.secondary,
        contentBackgroundColor: Theme.of(context).colorScheme.surface,
        children: [
          AccordionSection(
            isOpen: true,
            leftIcon: const Icon(Icons.filter_list, color: Colors.white),
            header: const Text('筛选分组', style: TextStyle(color: Colors.white)),
            content: const Text('使用 AccordionSection 展示可展开的列表筛选条件。'),
          ),
          AccordionSection(
            leftIcon: const Icon(Icons.view_list, color: Colors.white),
            header: const Text('列表行', style: TextStyle(color: Colors.white)),
            content: const Text('每个折叠区都可以放入任意 Flutter 内容。'),
          ),
        ],
      ),
    );
  }
}

class AnimatedReorderableListDemo extends StatefulWidget {
  const AnimatedReorderableListDemo({super.key});

  @override
  State<AnimatedReorderableListDemo> createState() =>
      _AnimatedReorderableListDemoState();
}

class _AnimatedReorderableListDemoState
    extends State<AnimatedReorderableListDemo> {
  final _items = ['待办', '设计', '开发', '验证', '发布'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: AnimatedReorderableListView<String>(
        items: _items,
        buildDefaultDragHandles: true,
        isSameItem: (a, b) => a == b,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            final item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            key: ValueKey(item),
            child: ListTile(
              leading: const Icon(Icons.drag_indicator),
              title: Text(item),
              subtitle: const Text('拖动左侧手柄调整顺序。'),
            ),
          );
        },
      ),
    );
  }
}

class InstalledListPackageDemo extends StatelessWidget {
  const InstalledListPackageDemo({super.key, required this.plugin});

  final PluginInfo plugin;

  @override
  Widget build(BuildContext context) {
    return InfoDemo(
      icon: Icons.view_list,
      title: plugin.name,
      body:
          '${plugin.name} 已通过 pub get 解析，可以继续补充真实 API 示例。当前页面先保留插件入口，确保详情页可打开，后续可逐步升级为专属 demo。',
    );
  }
}
