import 'package:flutter/material.dart';

class FlutterChatUiDemo extends StatelessWidget {
  const FlutterChatUiDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Align(
          alignment: Alignment.centerLeft,
          child: _Bubble(text: '你好，插件 demo 已生成。', incoming: true),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: _Bubble(text: '看起来很像聊天 UI。', incoming: false),
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.add),
            hintText: '输入消息',
          ),
        ),
      ],
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.text, required this.incoming});

  final String text;
  final bool incoming;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 260),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: incoming
            ? Theme.of(context).colorScheme.surfaceContainerHighest
            : Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text),
    );
  }
}
