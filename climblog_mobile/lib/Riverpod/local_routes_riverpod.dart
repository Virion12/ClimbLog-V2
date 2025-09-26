import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
import 'package:climblog_mobile/database/database.dart';

final dbProvider = Provider<AppDatabase>((ref) => AppDatabase());

final routeServiceProvider = Provider<RouteService>((ref) {
  final db = ref.watch(dbProvider);
  return RouteService(db);
});


final routesProvider = StreamProvider.autoDispose<List<ClimbingRoute>>((ref) {
  final routeService = ref.watch(routeServiceProvider);

  
  return routeService.watchAllRoutesWithoutToDelete().map((routes) {
    debugPrint("=== Aktualne lokalne drogi ===");
    if (routes.isEmpty) {
      debugPrint("Brak dróg w bazie.");
    } else {
      for (var r in routes) {
        debugPrint(
          "ID: ${r.id}, Name: ${r.name}, Color: ${r.color}, Height: ${r.height}, BackendId: ${r.backendId}"
        );
      }
    }
    debugPrint("=== Koniec listy ===");
    return routes;
  });
});

final selectedRouteProvider = StateProvider<ClimbingRoute?>((ref) => null);


//Filtering Date

enum DateFilterOption {
  all,
  lastDay,
  lastWeek,
  lastMonth,
  last3Months,
  last6Months,
  lastYear,
}


final dataProvider = StateProvider<DateFilterOption>((ref) => DateFilterOption.all);

final filteredRoutesProvider = StreamProvider.autoDispose<List<ClimbingRoute>>((ref) {
  final routeService = ref.watch(routeServiceProvider);
  final filter = ref.watch(dataProvider);

  return routeService.watchAllRoutesWithoutToDelete().map((routes) {
    final now = DateTime.now();
    DateTime? fromDate;

    switch (filter) {
      case DateFilterOption.all:
        fromDate = null;
        break;
      case DateFilterOption.lastDay:
        fromDate = now.subtract(const Duration(days: 1));
        break;
      case DateFilterOption.lastWeek:
        fromDate = now.subtract(const Duration(days: 7));
        break;
      case DateFilterOption.lastMonth:
        fromDate = DateTime(now.year, now.month - 1, now.day);
        break;
      case DateFilterOption.last3Months:
        fromDate = DateTime(now.year, now.month - 3, now.day);
        break;
      case DateFilterOption.last6Months:
        fromDate = DateTime(now.year, now.month - 6, now.day);
        break;
      case DateFilterOption.lastYear:
        fromDate = DateTime(now.year - 1, now.month, now.day);
        break;
    }

    if (fromDate != null) {
      routes = routes.where((r) => r.createdAt.isAfter(fromDate!)).toList();
    }

    return routes;
  });
});
