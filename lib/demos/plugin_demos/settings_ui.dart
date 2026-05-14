import 'package:flutter/material.dart';

class SettingsUiDemo extends StatelessWidget {
  const SettingsUiDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SwitchListTile(value: true, onChanged: null, title: Text('消息通知')),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text('隐私设置'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}

class CalendarLikeDemo extends StatelessWidget {
  const CalendarLikeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: [
        for (var day = 1; day <= 14; day++)
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: day == 7
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('$day'),
          ),
      ],
    );
  }
}

class SidebarDemo extends StatelessWidget {
  const SidebarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Row(
        children: [
          NavigationRail(
            selectedIndex: 0,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                label: Text('看板'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('设置'),
              ),
            ],
          ),
          const VerticalDivider(width: 1),
          const Expanded(child: Center(child: Text('侧边栏导航内容区'))),
        ],
      ),
    );
  }
}
