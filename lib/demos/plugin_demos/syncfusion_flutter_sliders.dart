import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SyncfusionFlutterSlidersDemo extends StatefulWidget {
  const SyncfusionFlutterSlidersDemo({super.key});

  @override
  State<SyncfusionFlutterSlidersDemo> createState() =>
      _SyncfusionFlutterSlidersDemoState();
}

class _SyncfusionFlutterSlidersDemoState
    extends State<SyncfusionFlutterSlidersDemo> {
  double _value = 42;
  SfRangeValues _range = const SfRangeValues(20, 75);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Single value: ${_value.round()}'),
        SfSlider(
          value: _value,
          min: 0,
          max: 100,
          interval: 20,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          onChanged: (value) => setState(() => _value = value as double),
        ),
        const SizedBox(height: 12),
        Text('Range: ${_range.start.round()} - ${_range.end.round()}'),
        SfRangeSlider(
          values: _range,
          min: 0,
          max: 100,
          interval: 20,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          onChanged: (values) => setState(() => _range = values),
        ),
      ],
    );
  }
}
