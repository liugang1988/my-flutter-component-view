import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFieldsDemo extends StatelessWidget {
  const PinCodeFieldsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      autoFocus: false,
      keyboardType: TextInputType.number,
      onChanged: (_) {},
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 48,
        fieldWidth: 42,
        activeColor: Theme.of(context).colorScheme.primary,
        selectedColor: Theme.of(context).colorScheme.primary,
        inactiveColor: Theme.of(context).colorScheme.outlineVariant,
      ),
    );
  }
}
