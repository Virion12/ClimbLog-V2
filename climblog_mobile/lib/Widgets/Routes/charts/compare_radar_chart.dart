import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RadarChartRoutesCompare extends ConsumerWidget {
  final double? height;
  final double? width;

  const RadarChartRoutesCompare({
    super.key,
    this.height,
    this.width,
  });

  static const List<String> titles = [
    'Crimpy',
    'Dynamic',
    'Reachy',
    'Powery',
    'Sloppy'
  ];

  List<double> _calculateStyleData(List<ClimbingRoute> routes) {
    List<double> data = List.filled(titles.length, 0.0);

    if (routes.isNotEmpty) {
      for (var route in routes) {
        final attributes = [
          route.isCrimpy,
          route.isDynamic,
          route.isReachy,
          route.isPowery,
          route.isSloppy,
        ];
        for (int i = 0; i < attributes.length; i++) {
          if (attributes[i]) data[i]++;
        }
      }
    }
    return data;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes1Async = ref.watch(climbingRoutesStreamProviderForChartdata1);
    final routes2Async = ref.watch(climbingRoutesStreamProviderForChartdata2);

    return SizedBox(
      height: height ?? 280,
      width: width ?? double.infinity,
      child: routes1Async.when(
        data: (routes1) {
          return routes2Async.when(
            data: (routes2) {
              final data1 = _calculateStyleData(routes1);
              final data2 = _calculateStyleData(routes2);

              final hasData1 = data1.any((v) => v > 0);
              final hasData2 = data2.any((v) => v > 0);

              if (!hasData1 && !hasData2) {
                return const Center(
                  child: Text("No chart data"),
                );
              }

              return _RadarChart(
                data1: data1,
                data2: data2,
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text("Error dataset 2")),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error dataset 1")),
      ),
    );
  }
}

class _RadarChart extends StatelessWidget {
  final List<double> data1;
  final List<double> data2;

  const _RadarChart({
    required this.data1,
    required this.data2,
  });

  static const List<String> titles = [
    'Crimpy',
    'Dynamic',
    'Reachy',
    'Powery',
    'Sloppy'
  ];

  @override
  Widget build(BuildContext context) {
    final maxValue = [
      ...data1,
      ...data2,
    ].reduce((a, b) => a > b ? a : b);
    final chartMax = (maxValue == 0) ? 1.0 : (maxValue * 1.2);

    final color1 = Colors.blue;
    final color2 = Colors.orange;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: RadarChart(
        RadarChartData(
          radarShape: RadarShape.polygon,
          dataSets: [
            RadarDataSet(
              dataEntries:
                  data1.map((v) => RadarEntry(value: v)).toList(),
              borderColor: color1,
              fillColor: color1.withValues(alpha: 0.4),
              borderWidth: 2,
              entryRadius: 3,
            ),
            RadarDataSet(
              dataEntries:
                  data2.map((v) => RadarEntry(value: v)).toList(),
              borderColor: color2,
              fillColor: color2.withValues(alpha: 0.4),
              borderWidth: 2,
              entryRadius: 3,
            ),
          ],
          getTitle: (index, _) =>
              RadarChartTitle(text: titles[index]),
          radarBorderData: BorderSide(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.6)),
          tickBorderData: BorderSide(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.3)),
          ticksTextStyle: const TextStyle(color: Colors.transparent),
          tickCount: 2,
          gridBorderData: BorderSide(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.2)),
        ),
      ),
    );
  }
}
