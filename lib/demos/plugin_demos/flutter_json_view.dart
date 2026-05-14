import 'package:flutter/material.dart';

import 'generic_demo.dart';

class FlutterJsonViewDemo extends StatelessWidget {
  const FlutterJsonViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoPanel(
      child: Text(
        '{\n  "package": "flutter_json_view",\n  "expanded": true,\n  "nodes": ["object", "array", "value"]\n}',
        style: TextStyle(fontFamily: 'monospace'),
      ),
    );
  }
}
