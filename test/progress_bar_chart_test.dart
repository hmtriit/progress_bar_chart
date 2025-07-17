import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:progress_bar_chart_widget/progress_bar_chart.dart';

void main() {
  group('ProgressBarChart Widget', () {
    final chartData = ChartData(
      title: 'Revenue',
      subtitle: 'This month vs last month',
      currentValue: 60,
      previousValue: 80,
      averageValue: 90,
      maxValue: 100,
      unit: 'million',
    );

    testWidgets('Displays title, subtitle, legend', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ProgressBarChart(data: chartData)),
        ),
      );
      expect(find.text('Revenue'), findsOneWidget);
      expect(find.text('This month vs last month'), findsOneWidget);
      expect(find.text('This Month'), findsOneWidget);
      expect(find.text('Last Month'), findsOneWidget);
      expect(find.text('Average'), findsOneWidget);
    });

    testWidgets('Hides legend when showLegend=false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProgressBarChart(data: chartData, showLegend: false),
          ),
        ),
      );
      expect(find.text('This Month'), findsNothing);
      expect(find.text('Last Month'), findsNothing);
      expect(find.text('Average'), findsNothing);
    });
  });

  group('AnimatedProgressBarChart Widget', () {
    final chartData = ChartData(
      title: 'Production',
      subtitle: 'Monthly comparison',
      currentValue: 30,
      previousValue: 50,
      averageValue: 70,
      maxValue: 100,
      unit: 'tons',
    );

    testWidgets('Displays title, subtitle, legend', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: AnimatedProgressBarChart(data: chartData)),
        ),
      );
      expect(find.text('Production'), findsOneWidget);
      expect(find.text('Monthly comparison'), findsOneWidget);
      expect(find.text('This Month'), findsOneWidget);
      expect(find.text('Last Month'), findsOneWidget);
      expect(find.text('Average'), findsOneWidget);
    });

    testWidgets('Hides legend when showLegend=false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedProgressBarChart(data: chartData, showLegend: false),
          ),
        ),
      );
      expect(find.text('This Month'), findsNothing);
      expect(find.text('Last Month'), findsNothing);
      expect(find.text('Average'), findsNothing);
    });
  });
}
