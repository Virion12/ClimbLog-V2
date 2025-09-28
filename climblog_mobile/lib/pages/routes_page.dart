import 'package:climblog_mobile/Widgets/Routes/all_routes.dart';
import 'package:climblog_mobile/Widgets/Routes/data_filter_buttons.dart';
import 'package:climblog_mobile/Widgets/Routes/route_count.dart';
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
        children: const [
          DateFilterButtons(),
          RouteCount(),
          Expanded(
            child: AllRoutes(),
          ),
        ],
      );
    
  }
}