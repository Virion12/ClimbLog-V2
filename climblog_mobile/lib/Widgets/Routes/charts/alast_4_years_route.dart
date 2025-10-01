import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartRoutesByYear extends ConsumerWidget {
  final double? height;
  final double? width;

  const ChartRoutesByYear({
    super.key,
    this.height,
    this.width,
  });

  List<double> _calculateYearData(List<ClimbingRoute> routes) {
    int currentYear = DateTime.now().year;
    List<double> yearData = List.filled(4, 0);

    if (routes.isNotEmpty) {
      for (var route in routes) {
        final date = route.createdAt;
        int yearDiff = date.year - (currentYear - 3);
        if (yearDiff >= 0 && yearDiff < 4) {
          yearData[yearDiff]++;
        }
      }
    }
    return yearData;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredRoutesAsyncValue = ref.watch(filteredRoutesProvider);

    return SizedBox(
      height: height,
      width: width,
      child: filteredRoutesAsyncValue.when(
        data: (routes) {
          final yearData = _calculateYearData(routes);

          if (routes.isEmpty || yearData.every((count) => count == 0)) {
            return Center(
              child: Text(
                "No chart data",
                style: TextStyle(
                  color:
                      Theme.of(context).textTheme.bodySmall?.color ?? Colors.grey,
                ),
              ),
            );
          }

          return _BarChart(yearData: yearData);
        },
        loading: () =>
            const Center(child: CircularProgressIndicator(strokeWidth: 2)),
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
  final List<double> yearData;
  const _BarChart({required this.yearData});

  final LinearGradient _barsGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 230, 38, 70),
      Color.fromARGB(255, 238, 241, 39),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    double maxYValue =
        yearData.isNotEmpty ? yearData.reduce((a, b) => a > b ? a : b) : 0.0;
    final double chartMaxY = (maxYValue == 0) ? 5.0 : (maxYValue * 1.2);

    final Color tooltipBgColor = Theme.of(context).colorScheme.secondary;
    final Color tooltipTextColor = Theme.of(context).colorScheme.onSecondary;
    final Color titleColor =
        Theme.of(context).textTheme.bodySmall?.color ?? Colors.grey;

    return BarChart(
      BarChartData(
        maxY: chartMaxY,
        alignment: BarChartAlignment.spaceAround,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: _generateBarGroups(yearData, currentYear),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) =>
                  _bottomTitleWidgets(value, meta, titleColor, currentYear),
            ),
          ),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) => tooltipBgColor,
            tooltipPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            tooltipMargin: 8,
            getTooltipItem: (groupData, groupIndex, rodData, rodIndex) {
              String text = rodData.toY.round().toString();
              return BarTooltipItem(
                text,
                TextStyle(
                  color: tooltipTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _generateBarGroups(
      List<double> yearData, int currentYear) {
    return List.generate(yearData.length, (index) {
      return BarChartGroupData(
        x: currentYear - 3 + index,
        barRods: [
          BarChartRodData(
            toY: yearData[index],
            gradient: _barsGradient,
            width: 16,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ],
      );
    });
  }

  Widget _bottomTitleWidgets(
      double value, TitleMeta meta, Color textColor, int currentYear) {
    final style = TextStyle(
      color: textColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    String text = "";
    // pokazywanie roku na osi X
    if (value.toInt() >= currentYear - 3 && value.toInt() <= currentYear) {
      text = value.toInt().toString();
    }

    return SideTitleWidget(
      meta: meta,
      space: 4.0,
      child: Text(text, style: style),
    );
  }
}
