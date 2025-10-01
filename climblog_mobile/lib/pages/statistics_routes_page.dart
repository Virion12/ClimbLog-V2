import 'package:climblog_mobile/Widgets/Routes/charts/alast_4_years_route.dart';
import 'package:climblog_mobile/Widgets/Routes/charts/all_by_month_route.dart';
import 'package:climblog_mobile/Widgets/Routes/charts/grade_chart_route.dart';
import 'package:climblog_mobile/Widgets/Routes/charts/radar_chart_route_details.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';

class StatisticsRoutesPage extends StatefulWidget {
  const StatisticsRoutesPage({super.key});

  @override
  State<StatisticsRoutesPage> createState() => _StatisticsRoutesPageState();
}

class _StatisticsRoutesPageState extends State<StatisticsRoutesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      ),
      backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BasicContainer(child: Text("By grade :", textAlign: TextAlign.center,)),
            BasicContainer(child: 
            RoutesChart(height: 200,)),
            SizedBox(height: 30,),
            BasicContainer(child: Text("By characteristic :", textAlign: TextAlign.center,)),
            BasicContainer(child: 
            RadarchartStatistic()),
            SizedBox(height: 30,),
            BasicContainer(child: Text("By Month All :", textAlign: TextAlign.center,)),
            BasicContainer(child: 
            ChartRoutesByMonth(height: 200,)),
            SizedBox(height: 30,),
            BasicContainer(child: Text("Last 4 years :", textAlign: TextAlign.center,)),
            BasicContainer(child: 
            ChartRoutesByYear(height: 200,)),
          ],
        ),
      ),
    );
  }
}