import 'package:climblog_mobile/Widgets/Routes/all_routes.dart';
import 'package:climblog_mobile/Widgets/Routes/route_add_button.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';

class RoutesPage extends StatefulWidget {
  const RoutesPage({super.key});

  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      body: Column(
        children: const [
          Expanded(
            child: AllRoutes(),
          ),
        ],
      ),
    );
  }
}