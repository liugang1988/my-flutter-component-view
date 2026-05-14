import 'package:flutter/material.dart';

class TwoDimensionalScrollablesDemo extends StatelessWidget {
  const TwoDimensionalScrollablesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('插件')),
          DataColumn(label: Text('分类')),
          DataColumn(label: Text('状态')),
        ],
        rows: const [
          DataRow(
            cells: [
              DataCell(Text('material_table_view')),
              DataCell(Text('表格')),
              DataCell(Text('高性能')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('two_dimensional_scrollables')),
              DataCell(Text('二维滚动')),
              DataCell(Text('冻结行列')),
            ],
          ),
        ],
      ),
    );
  }
}
