import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class OktoastDemo extends StatelessWidget {
  const OktoastDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: Builder(
        builder: (toastContext) {
          return Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton.icon(
                onPressed: () => showToast(
                  'OKToast message',
                  context: toastContext,
                  position: ToastPosition.bottom,
                ),
                icon: const Icon(Icons.message),
                label: const Text('Bottom toast'),
              ),
              OutlinedButton.icon(
                onPressed: () => showToastWidget(
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.cloud_done, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Custom toast widget',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  context: toastContext,
                  position: ToastPosition.center,
                ),
                icon: const Icon(Icons.widgets),
                label: const Text('Custom toast'),
              ),
            ],
          );
        },
      ),
    );
  }
}
