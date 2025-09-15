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
