import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouteCount extends ConsumerStatefulWidget {
  const RouteCount({super.key});
  
  @override
  ConsumerState<RouteCount> createState() => _RouteCountState();
}

class _RouteCountState extends ConsumerState<RouteCount> {
  static const Color _primaryColor = Color(0xFF00a896);
  
  @override
  Widget build(BuildContext context) {
    final routesAsync = ref.watch(filteredRoutesProvider);
    
    return BasicContainer(
      child: routesAsync.when(
        data: (routes) {
          int routesCount = routes.isNotEmpty ? routes.length : 0;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              children: [
                Text(
                  "All routes",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  routesCount.toString(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                    color: _primaryColor,
                    height: 1,
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(_primaryColor),
              ),
            ),
          ),
        ),
        error: (error, stack) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'Unable to load routes',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}