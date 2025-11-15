import 'package:climblog_mobile/Services/local_db/benchmark_service.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
import 'package:climblog_mobile/Services/local_db/workout_service.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:climblog_mobile/Widgets/home/home_container.dart';
import 'package:climblog_mobile/Widgets/home/home_days_row.dart';
import 'package:climblog_mobile/Widgets/home/home_trening_card.dart';
import 'package:climblog_mobile/Widgets/home/mountain_proggress.bar.dart';
import 'package:climblog_mobile/Widgets/mock.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final route = RouteService(AppDatabase());
  final benchmark = BenchmarkService(AppDatabase());
  final work = WorkoutService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        
        children: [
          MountainProgressBar(),
          HomeContaner(),
          BasicContainer(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                HomeDaysRow(),
                HomeTreningCard(),
                // TestDataGenerator(routeService: route, benchmarkService: benchmark, workoutService: work,),
            ],
          ))
          
        ],
      ),
    );
  }
}