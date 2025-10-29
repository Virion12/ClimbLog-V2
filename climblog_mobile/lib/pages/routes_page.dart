import 'package:climblog_mobile/Widgets/Routes/data_filter_buttons.dart';
import 'package:climblog_mobile/Widgets/Routes/route_count.dart';
import 'package:climblog_mobile/Widgets/Routes/routes_all_suggestion_box.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          DateFilterButtons(),
          RouteCount(),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/routeStatistic");
                },
                child: BasicHalfContainer(
                  child: _ButtonContent(
                    label: "Statistics",
                    icon: Icons.bar_chart_rounded,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/routesCompare");
                },
                child: BasicHalfContainer(
                  child: _ButtonContent(
                    label: "Compare",
                    icon: Icons.compare_arrows_rounded,
                  ),
                ),
              ),
            ],
          ),
          
          RoutesAllSuggestionBox(),
          SingleChildScrollView(
            child: Top60Routes(),
          ),
        ],
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  final String label;
  final IconData icon;
  
  static const Color _primaryColor = Color(0xFF00a896);

  const _ButtonContent({
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _primaryColor,
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}