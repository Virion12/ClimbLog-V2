import 'package:climblog_mobile/Widgets/Routes/data_filter_buttons.dart';
import 'package:climblog_mobile/Widgets/Routes/route_count.dart';
import 'package:climblog_mobile/Widgets/Routes/routes_home_stats.dart';
import 'package:climblog_mobile/Widgets/Routes/top60_routes.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_half_container.dart';
import 'package:flutter/material.dart';

class RoutesPage extends StatefulWidget {
  const RoutesPage({super.key});

  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children:  [
          DateFilterButtons(),
          RouteCount(),
          
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/routeStatistic");
                  
                },
                child: BasicHalfContainer(child: Text("Statistics",textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),)),
                GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/routesCompare");
                },
                child: BasicHalfContainer(child: Text("Compare",textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),)),
            ],
          ),
          
          SingleChildScrollView(
            child: Top60Routes(),
          ),
        ],
      );
    
  }
}