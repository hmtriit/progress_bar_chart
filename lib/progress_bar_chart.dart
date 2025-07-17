import 'package:flutter/material.dart';

/// Model class for chart data
class ChartData {
  final String title;
  final String subtitle;
  final double currentValue;
  final double previousValue;
  final double averageValue;
  final double maxValue;
  final String unit;

  ChartData({
    required this.title,
    required this.subtitle,
    required this.currentValue,
    required this.previousValue,
    required this.averageValue,
    required this.maxValue,
    this.unit = '',
  });
}

/// Legend item model
class LegendItem {
  final Color color;
  final String label;

  LegendItem({required this.color, required this.label});
}

/// Main Progress Bar Chart Widget
class ProgressBarChart extends StatelessWidget {
  final ChartData data;
  final Color currentColor;
  final Color previousColor;
  final Color averageColor;
  final Color backgroundColor;
  final double height;
  final double borderRadius;
  final bool showLegend;
  final List<LegendItem>? customLegend;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final EdgeInsets padding;
  final double markerWidth;
  final Color markerColor;

  const ProgressBarChart({
    super.key,
    required this.data,
    this.currentColor = const Color(0xFF6366F1),
    this.previousColor = const Color(0xFFA855F7),
    this.averageColor = const Color(0xFFE5E7EB),
    this.backgroundColor = const Color(0xFFF9FAFB),
    this.height = 40.0,
    this.borderRadius = 20.0,
    this.showLegend = true,
    this.customLegend,
    this.titleStyle,
    this.subtitleStyle,
    this.padding = const EdgeInsets.all(16.0),
    this.markerWidth = 3.0,
    this.markerColor = const Color(0xFF374151),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showLegend) _buildLegend(),
          if (showLegend) const SizedBox(height: 20),
          _buildTitle(),
          const SizedBox(height: 8),
          _buildSubtitle(),
          const SizedBox(height: 20),
          _buildChart(),
          const SizedBox(height: 16),
          _buildAxisLabels(),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    final legendItems =
        customLegend ??
        [
          LegendItem(color: currentColor, label: 'This Month'),
          LegendItem(color: previousColor, label: 'Last Month'),
          LegendItem(color: averageColor, label: 'Average'),
        ];

    return Row(
      children: legendItems.map((item) {
        return Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: item.color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                item.label,
                style: const TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTitle() {
    return Text(
      data.title,
      style:
          titleStyle ??
          const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      data.subtitle,
      style:
          subtitleStyle ??
          const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
    );
  }

  Widget _buildChart() {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Background bar
              Container(
                width: double.infinity,
                height: height,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              // Combined progress bars
              Row(
                children: [
                  // Current value section
                  Container(
                    width:
                        (data.currentValue / data.maxValue) *
                        constraints.maxWidth,
                    height: height,
                    decoration: BoxDecoration(
                      color: currentColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(borderRadius),
                        bottomLeft: Radius.circular(borderRadius),
                      ),
                    ),
                  ),
                  // Previous value section (additional part)
                  if (data.previousValue > data.currentValue)
                    Container(
                      width:
                          ((data.previousValue - data.currentValue) /
                              data.maxValue) *
                          constraints.maxWidth,
                      height: height,
                      color: previousColor,
                    ),
                  // Average value section (additional part)
                  if (data.averageValue > data.previousValue)
                    Container(
                      width:
                          ((data.averageValue - data.previousValue) /
                              data.maxValue) *
                          constraints.maxWidth,
                      height: height,
                      color: averageColor,
                    ),
                ],
              ),
              // Marker line at current value
              _buildMarker(constraints.maxWidth),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMarker(double containerWidth) {
    // Marker positioned at current value
    final markerPosition = data.currentValue / data.maxValue;

    return Positioned(
      left: (markerPosition * containerWidth) - (markerWidth / 2),
      top: 0,
      child: Container(
        width: markerWidth,
        height: height,
        decoration: BoxDecoration(
          color: markerColor,
          borderRadius: BorderRadius.circular(markerWidth / 2),
        ),
      ),
    );
  }

  Widget _buildAxisLabels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '0',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          (data.maxValue * 0.4).toStringAsFixed(1),
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          (data.maxValue * 0.6).toStringAsFixed(1),
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          (data.maxValue * 0.8).toStringAsFixed(1),
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          data.maxValue.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

/// Animated version of Progress Bar Chart
class AnimatedProgressBarChart extends StatefulWidget {
  final ChartData data;
  final Color currentColor;
  final Color previousColor;
  final Color averageColor;
  final Color backgroundColor;
  final double height;
  final double borderRadius;
  final bool showLegend;
  final List<LegendItem>? customLegend;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final EdgeInsets padding;
  final double markerWidth;
  final Color markerColor;
  final Duration animationDuration;

  const AnimatedProgressBarChart({
    super.key,
    required this.data,
    this.currentColor = const Color(0xFF6366F1),
    this.previousColor = const Color(0xFFA855F7),
    this.averageColor = const Color(0xFFE5E7EB),
    this.backgroundColor = const Color(0xFFF9FAFB),
    this.height = 40.0,
    this.borderRadius = 20.0,
    this.showLegend = true,
    this.customLegend,
    this.titleStyle,
    this.subtitleStyle,
    this.padding = const EdgeInsets.all(16.0),
    this.markerWidth = 3.0,
    this.markerColor = const Color(0xFF374151),
    this.animationDuration = const Duration(milliseconds: 1500),
  });

  @override
  State<AnimatedProgressBarChart> createState() =>
      _AnimatedProgressBarChartState();
}

class _AnimatedProgressBarChartState extends State<AnimatedProgressBarChart>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _currentAnimation;
  late Animation<double> _previousAnimation;
  late Animation<double> _averageAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _currentAnimation =
        Tween<double>(
          begin: 0.0,
          end: widget.data.currentValue / widget.data.maxValue,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _previousAnimation =
        Tween<double>(
          begin: 0.0,
          end: widget.data.previousValue / widget.data.maxValue,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _averageAnimation =
        Tween<double>(
          begin: 0.0,
          end: widget.data.averageValue / widget.data.maxValue,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          padding: widget.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.showLegend) _buildLegend(),
              if (widget.showLegend) const SizedBox(height: 20),
              _buildTitle(),
              const SizedBox(height: 8),
              _buildSubtitle(),
              const SizedBox(height: 20),
              _buildChart(),
              const SizedBox(height: 16),
              _buildAxisLabels(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLegend() {
    final legendItems =
        widget.customLegend ??
        [
          LegendItem(color: widget.currentColor, label: 'This Month'),
          LegendItem(color: widget.previousColor, label: 'Last Month'),
          LegendItem(color: widget.averageColor, label: 'Average'),
        ];

    return Row(
      children: legendItems.map((item) {
        return Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: item.color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                item.label,
                style: const TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.data.title,
      style:
          widget.titleStyle ??
          const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      widget.data.subtitle,
      style:
          widget.subtitleStyle ??
          const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
    );
  }

  Widget _buildChart() {
    return SizedBox(
      height: widget.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Background bar
              Container(
                width: double.infinity,
                height: widget.height,
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
              ),
              // Combined progress bars
              Row(
                children: [
                  // Current value section
                  Container(
                    width: _currentAnimation.value * constraints.maxWidth,
                    height: widget.height,
                    decoration: BoxDecoration(
                      color: widget.currentColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(widget.borderRadius),
                        bottomLeft: Radius.circular(widget.borderRadius),
                      ),
                    ),
                  ),
                  // Previous value section (additional part)
                  if (widget.data.previousValue > widget.data.currentValue)
                    Container(
                      width:
                          (_previousAnimation.value - _currentAnimation.value) *
                          constraints.maxWidth,
                      height: widget.height,
                      color: widget.previousColor,
                    ),
                  // Average value section (additional part)
                  if (widget.data.averageValue > widget.data.previousValue)
                    Container(
                      width:
                          (_averageAnimation.value - _previousAnimation.value) *
                          constraints.maxWidth,
                      height: widget.height,
                      color: widget.averageColor,
                    ),
                ],
              ),
              // Marker line at current value
              _buildMarker(constraints.maxWidth),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProgressBar(double progress, Color color) {
    return FractionallySizedBox(
      widthFactor: progress,
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
    );
  }

  Widget _buildMarker(double containerWidth) {
    return Positioned(
      left:
          (_currentAnimation.value * containerWidth) - (widget.markerWidth / 2),
      top: 0,
      child: Container(
        width: widget.markerWidth,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.markerColor,
          borderRadius: BorderRadius.circular(widget.markerWidth / 2),
        ),
      ),
    );
  }

  Widget _buildAxisLabels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '0',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          (widget.data.maxValue * 0.4).toStringAsFixed(1),
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          (widget.data.maxValue * 0.6).toStringAsFixed(1),
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          (widget.data.maxValue * 0.8).toStringAsFixed(1),
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          widget.data.maxValue.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
