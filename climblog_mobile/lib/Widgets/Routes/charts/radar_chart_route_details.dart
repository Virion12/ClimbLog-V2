import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RadarchartStatistic extends ConsumerWidget {
  const RadarchartStatistic({super.key});

 List<double> _chartData(List<ClimbingRoute> routes) {
  List<double> chartData = List.filled(5, 0.0);

  if(routes.isNotEmpty){
    for (var route in routes) {
      final attributes = [
        route.isCrimpy,
        route.isDynamic,
        route.isReachy,
        route.isPowery,
        route.isSloppy,
      ];

      for (int i = 0; i < attributes.length; i++) {
        if (attributes[i]) chartData[i]++;
      }
    }
 }
  return chartData;
}

static const List<String> titles = ['Crimpy','Dynamic','Reachy','Powery','Sloppy'];

  List<RadarDataSet> _displayDataSets(List<double> chartData) {
    return [
      RadarDataSet(
        dataEntries: chartData.map((value) => RadarEntry(value: value)).toList(),
        borderColor: Colors.blue,
        fillColor: Colors.blue.withValues(alpha: 0.4),
        entryRadius: 3,
        borderWidth: 2,
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredRoutesAsyncValue = ref.watch(filteredRoutesProvider);
    
    return filteredRoutesAsyncValue.when(
      data: (routes) {
        final chartData = _chartData(routes);
        final displaydataset = _displayDataSets(chartData);

        return Container(
          // margin: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
          padding: EdgeInsets.all(10),
          height: 230,
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: RadarChart(
            RadarChartData(
              radarShape: RadarShape.polygon,
              dataSets: displaydataset,
              getTitle: (index, _) => RadarChartTitle(text: titles[index]),
              tickCount: 2,
              ticksTextStyle: const TextStyle(color: Colors.transparent),
              tickBorderData: BorderSide(color: Colors.blueGrey),
              gridBorderData: const BorderSide(color: Colors.transparent),
              radarBorderData: BorderSide(color: Colors.blueGrey)
              )
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}