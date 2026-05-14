import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

void main() {
  testWidgets('shows plugin market home page', (tester) async {
    await tester.pumpWidget(const PluginMarketApp());

    expect(find.text('pub.dev 热门 UI 交互插件'), findsOneWidget);
    expect(find.text('热门 UI/交互 + Flutter Favorite 插件'), findsOneWidget);
    expect(find.text('flutter_svg'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(SelectionArea), findsOneWidget);
  });

  testWidgets('filters plugins by search query', (tester) async {
    await tester.pumpWidget(const PluginMarketApp());

    await tester.enterText(find.byType(TextField), 'confetti');
    await tester.pumpAndSettle();

    expect(find.widgetWithText(PluginCard, 'confetti'), findsOneWidget);
    expect(find.text('flutter_svg'), findsNothing);
  });
}
