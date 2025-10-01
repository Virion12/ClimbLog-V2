import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartRoutesByMonth extends ConsumerWidget {
  final double? height;
  final double? width;

  const ChartRoutesByMonth({
    super.key,
    this.height,
    this.width,
  });

  List<double> _calculateMonthData(List<ClimbingRoute> routes) {
    List<double> monthData = List.filled(12, 0.0);
    if (routes.isNotEmpty) {
      for (var route in routes) {
        final date = route.createdAt; 
        if (date.year == DateTime.now().year) {
          monthData[date.month - 1]++;
        }
      }
    }
    return monthData;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredRoutesAsyncValue = ref.watch(filteredRoutesProvider);

    return SizedBox(
      height: height,
      width: width,
      child: filteredRoutesAsyncValue.when(
        data: (routes) {
          final monthData = _calculateMonthData(routes);

          if (routes.isEmpty || monthData.every((count) => count == 0)) {
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

          return _BarChart(monthData: monthData);
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
  final List<double> monthData;
  const _BarChart({required this.monthData});

  final LinearGradient _barsGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 188, 34, 226),
      Color.fromARGB(255, 74, 20, 201),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const List<String> monthLabels = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  @override
  Widget build(BuildContext context) {
    double maxYValue = monthData.isNotEmpty
        ? monthData.reduce((a, b) => a > b ? a : b)
        : 0.0;
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
        barGroups: _generateBarGroups(),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) =>
                  _bottomTitleWidgets(value, meta, titleColor),
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

  List<BarChartGroupData> _generateBarGroups() {
    return List.generate(monthData.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: monthData[index],
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
      fontSize: 12,
    );
    String text = "";
    if (value.toInt() >= 0 && value.toInt() < monthLabels.length) {
      text = monthLabels[value.toInt()];
    }
    return SideTitleWidget(
      meta: meta,
      space: 4.0,
      child: Text(text, style: style),
    );
  }
}
