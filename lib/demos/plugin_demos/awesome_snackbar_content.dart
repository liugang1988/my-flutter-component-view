import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class AwesomeSnackbarContentDemo extends StatelessWidget {
  const AwesomeSnackbarContentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        FilledButton.icon(
          onPressed: () => _show(context, ContentType.success),
          icon: const Icon(Icons.check_circle),
          label: const Text('Success'),
        ),
        OutlinedButton.icon(
          onPressed: () => _show(context, ContentType.warning),
          icon: const Icon(Icons.warning_amber),
          label: const Text('Warning'),
        ),
        OutlinedButton.icon(
          onPressed: () => _show(context, ContentType.failure),
          icon: const Icon(Icons.error_outline),
          label: const Text('Failure'),
        ),
      ],
    );
  }

  void _show(BuildContext context, ContentType type) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Awesome snackbar',
        message: 'The content widget styles title, message, icon and color.',
        contentType: type,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
