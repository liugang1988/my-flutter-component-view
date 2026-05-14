import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneFormFieldDemo extends StatelessWidget {
  const PhoneFormFieldDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      initialValue: const PhoneNumber(isoCode: IsoCode.CN, nsn: '13800138000'),
      countrySelectorNavigator: const CountrySelectorNavigator.dialog(),
      validator: PhoneValidator.compose([
        PhoneValidator.required(context),
        PhoneValidator.validMobile(context),
      ]),
      decoration: const InputDecoration(
        labelText: 'Phone number',
        border: OutlineInputBorder(),
      ),
    );
  }
}
