import 'package:flutter/material.dart';
import 'package:progress_bar_chart/progress_bar_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Bar Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Open Sans'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Progress Bar Chart Demo'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Revenue Chart Example
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: ProgressBarChart(
                data: ChartData(
                  title: 'Revenue',
                  subtitle: 'US\$, In Thousands',
                  currentValue: 2.5,
                  previousValue: 3.2,
                  averageValue: 4.0,
                  maxValue: 5.0,
                  unit: 'k',
                ),
                // Colors match original
                currentColor: Color(0xFF6366F1), // Indigo-500
                previousColor: Color(0xFFA855F7), // Purple-500
                averageColor: Color(0xFFE5E7EB), // Gray-200
                backgroundColor: Color(0xFFF9FAFB), // Gray-50
                markerColor: Color(0xFF374151), // Gray-700
              ),
            ),

            // Animated Revenue Chart Example
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: AnimatedProgressBarChart(
                data: ChartData(
                  title: 'Sales Performance',
                  subtitle: 'Monthly Sales Data',
                  currentValue: 85,
                  previousValue: 70,
                  averageValue: 95,
                  maxValue: 120,
                  unit: '%',
                ),
                currentColor: Color(0xFF10B981),
                previousColor: Color(0xFF34D399),
                averageColor: Color(0xFF9CA3AF),
                animationDuration: Duration(milliseconds: 2000),
              ),
            ),

            // Custom Colors Example
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: ProgressBarChart(
                data: ChartData(
                  title: 'Website Traffic',
                  subtitle: 'Monthly Visitors',
                  currentValue: 12500,
                  previousValue: 10200,
                  averageValue: 15000,
                  maxValue: 20000,
                ),
                currentColor: Color(0xFFEF4444),
                previousColor: Color(0xFFF87171),
                averageColor: Color(0xFFD1D5DB),
                backgroundColor: Color(0xFFF9FAFB),
                customLegend: [
                  LegendItem(color: Color(0xFFEF4444), label: 'Current'),
                  LegendItem(color: Color(0xFFF87171), label: 'Previous'),
                  LegendItem(color: Color(0xFFD1D5DB), label: 'Target'),
                ],
              ),
            ),

            // Compact Version Example
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: ProgressBarChart(
                data: ChartData(
                  title: 'CPU Usage',
                  subtitle: 'System Performance',
                  currentValue: 65,
                  previousValue: 45,
                  averageValue: 80,
                  maxValue: 100,
                  unit: '%',
                ),
                height: 30,
                borderRadius: 15,
                showLegend: false,
                padding: EdgeInsets.all(12),
                currentColor: Color(0xFF3B82F6),
                previousColor: Color(0xFF93C5FD),
                averageColor: Color(0xFFE5E7EB),
              ),
            ),

            // Multiple Charts Example
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  AnimatedProgressBarChart(
                    data: ChartData(
                      title: 'Memory Usage',
                      subtitle: 'RAM Consumption',
                      currentValue: 4.2,
                      previousValue: 3.8,
                      averageValue: 5.1,
                      maxValue: 8.0,
                      unit: 'GB',
                    ),
                    currentColor: Color(0xFF8B5CF6),
                    previousColor: Color(0xFFC4B5FD),
                    height: 35,
                    showLegend: false,
                    animationDuration: Duration(milliseconds: 1000),
                  ),
                  Divider(color: Colors.grey.shade200),
                  AnimatedProgressBarChart(
                    data: ChartData(
                      title: 'Storage Usage',
                      subtitle: 'Disk Space',
                      currentValue: 120,
                      previousValue: 95,
                      averageValue: 150,
                      maxValue: 200,
                      unit: 'GB',
                    ),
                    currentColor: Color(0xFFF59E0B),
                    previousColor: Color(0xFFFBBF24),
                    height: 35,
                    showLegend: false,
                    animationDuration: Duration(milliseconds: 1200),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
