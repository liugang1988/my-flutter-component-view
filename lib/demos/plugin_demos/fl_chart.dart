import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlChartDemo extends StatelessWidget {
  const FlChartDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: LineChart(
        LineChartData(
          titlesData: const FlTitlesData(show: false),
          gridData: const FlGridData(show: true),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 2),
                FlSpot(1, 3.4),
                FlSpot(2, 2.6),
                FlSpot(3, 4.2),
                FlSpot(4, 3.8),
              ],
              isCurved: true,
              barWidth: 4,
              color: Theme.of(context).colorScheme.primary,
              dotData: const FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
