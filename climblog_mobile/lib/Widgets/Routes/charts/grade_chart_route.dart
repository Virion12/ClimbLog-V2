import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<String> climbingGrades = [
  // 4
  "4a", "4a+", "4b", "4b+", "4c", "4c+",
  // 5
  "5a", "5a+", "5b", "5b+", "5c", "5c+",
  // 6
  "6a", "6a+", "6b", "6b+", "6c", "6c+",
  // 7
  "7a", "7a+", "7b", "7b+", "7c", "7c+",
  // 8
  "8a", "8a+", "8b", "8b+", "8c", "8c+",
  // 9
  "9a", "9a+", "9b", "9b+", "9c"
];

final List<String> groupedGradeLabels = [
  "4a/+", "4b/+", "4c/+",
  "5a/+", "5b/+", "5c/+",
  "6a/+", "6b/+", "6c/+",
  "7a/+", "7b/+", "7c/+",
  "8a/+", "8b/+", "8c/+",
  "9a/+", "9b/+", "9c"
];

class RoutesChart extends ConsumerWidget {
  final double? height;
  final double? width;

  const RoutesChart({
    super.key,
    this.height,
    this.width,
  });

  List<double> _calculateGroupedGradeData(List<ClimbingRoute> routes) {
    List<double> groupedData = List.filled(groupedGradeLabels.length, 0.0);

    for (var route in routes) {
      final gradeIndex = climbingGrades.indexOf(route.grade);
      if (gradeIndex != -1) {
        
        final groupIndex = gradeIndex ~/ 2;
        groupedData[groupIndex]++;
      }
    }
    return groupedData;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredRoutesAsyncValue = ref.watch(filteredRoutesProvider);

    return SizedBox(
      height: height,
      width: width,
      child: filteredRoutesAsyncValue.when(
        data: (routes) {
          final gradeData = _calculateGroupedGradeData(routes);
          if (routes.isEmpty || gradeData.every((count) => count == 0)) {
            return Center(
              child: Text(
                "No chart data",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodySmall?.color ?? Colors.grey,
                ),
              ),
            );
          }
          return _BarChart(gradeData: gradeData);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Chart Error',
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ),
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  final List<double> gradeData;
  const _BarChart({required this.gradeData});

  final LinearGradient _barsGradient = const LinearGradient(
    colors: [Colors.lightBlueAccent, Colors.greenAccent],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  @override
  Widget build(BuildContext context) {
    double maxYValue = 0;
    if (gradeData.isNotEmpty) {
      maxYValue = gradeData.reduce((curr, next) => curr > next ? curr : next);
    }
    final double chartMaxY = (maxYValue == 0) ? 5.0 : (maxYValue * 1.2);

    final Color tooltipBgColor = Theme.of(context).colorScheme.secondary;
    final Color tooltipTextColor = Theme.of(context).colorScheme.onSecondary;
    final Color titleColor = Theme.of(context).textTheme.bodySmall?.color ?? Colors.grey;

    return BarChart(
      BarChartData(
        maxY: chartMaxY,
        barGroups: _generateBarGroups(),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) => _bottomTitleWidgets(value, meta, titleColor),
            ),
          ),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) => tooltipBgColor,
            tooltipPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            tooltipMargin: 8,
            getTooltipItem: (groupData, groupIndex, rodData, rodIndex) {
              String text = rodData.toY.round().toString();
              return BarTooltipItem(
                "${groupedGradeLabels[groupIndex]}: $text",
                TextStyle(
                  color: tooltipTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              );
            },
          ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        alignment: BarChartAlignment.spaceAround,
      ),
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    return List.generate(gradeData.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: gradeData[index],
            gradient: _barsGradient,
            width: 16,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ],
      );
    });
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta, Color textColor) {
    final style = TextStyle(
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    final int index = value.toInt();
    if (index < 0 || index >= groupedGradeLabels.length) {
      return const SizedBox.shrink();
    }
    
    if (index % 2 != 0) {
      return const SizedBox.shrink();
    }
    
    return SideTitleWidget(
      meta: meta,
      space: 6.0,
      child: Transform.rotate(
        angle: -0.785398, 
        child: Text(groupedGradeLabels[index], style: style),
      ),
    );
  }
}