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
  @override
  Widget build(BuildContext context) {
    final routesAsync = ref.watch(filteredRoutesProvider);
    return BasicContainer(child: 
    routesAsync.when(
                                data: (routes) {
                                  int routesCount = routes.isNotEmpty ? routes.length : 0;
                                  return Text("All routes:  ${routesCount.toString()}",textAlign: TextAlign.center ,style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16, 
                                  ),);
                                },
                                loading: () => Text('...'),
                                error: (error, stack) => Text('Error: $error'),
                              ),
    );
  }
}