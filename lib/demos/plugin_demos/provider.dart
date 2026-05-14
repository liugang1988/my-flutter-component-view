import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderCounterModel extends ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}

class ProviderDemo extends StatelessWidget {
  const ProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderCounterModel(),
      child: Consumer<ProviderCounterModel>(
        builder: (context, counter, _) {
          return Row(
            children: [
              Expanded(
                child: Text(
                  'Provider 计数：${counter.value}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              FilledButton.icon(
                onPressed: counter.increment,
                icon: const Icon(Icons.add),
                label: const Text('增加'),
              ),
            ],
          );
        },
      ),
    );
  }
}
