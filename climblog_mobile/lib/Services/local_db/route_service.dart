import 'package:drift/drift.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; 

class RouteService {
  final _storage = const FlutterSecureStorage();
  final AppDatabase _db;

  RouteService(this._db);

 Future<int> addRoute({
  required String name,
  required String color,
  double height = 0.0,
  bool isPowery = false,
  bool isSloppy = false,
  bool isDynamic = false,
  bool isCrimpy = false,
  bool isReachy = false,
  bool isOnsighted = false,
  bool isRedPointed = false,
  bool isFlashed = false,
  bool isFavorite = false,
  int numberOfTried = 0,
  bool isDone = false,
  String grade = "4a",
  String imagePath = "",
  String thumbnailPath = "",
  DateTime? createdAt,
  DateTime? lastUpdatedAt,
  bool isToUpdate = false,
  bool isToDelete = false,
  bool isAddedToBackend = false,
}) async {
  final userID = await _storage.read(key: "userid");
  if (userID == null) {
    throw Exception("User is not logged in");
  }
  final userIdToInt = int.parse(userID);

  final newId = await _db.into(_db.climbingRoutes).insert(
    ClimbingRoutesCompanion.insert(
      backendId: 0, 
      userId: userIdToInt,
      name: name,
      color: color,
      height: Value(height),
      isPowery: Value(isPowery),
      isSloppy: Value(isSloppy),
      isDynamic: Value(isDynamic),
      isCrimpy: Value(isCrimpy),
      isReachy: Value(isReachy),
      isOnsighted: Value(isOnsighted),
      isRedPointed: Value(isRedPointed),
      isFlashed: Value(isFlashed),
      isFavorite: Value(isFavorite),
      numberOfTried: Value(numberOfTried),
      isDone: Value(isDone),
      grade: Value(grade),
      imagePath: Value(imagePath),
      thumbnailPath: Value(thumbnailPath),
      createdAt: Value(createdAt ?? DateTime.now()),
      lastUpdatedAt: Value(lastUpdatedAt ?? DateTime.now()),
      isToUpdate: Value(isToUpdate),
      isToDelete: Value(isToDelete),
      isAddedToBackend: Value(isAddedToBackend),
    ),
  );

  return newId;
}
  Future<void> printAllRoutes() async {
  final routes = await _db.select(_db.climbingRoutes).get();

  if (routes.isEmpty) {
    debugPrint("Brak dróg w bazie.");
  } else {
    for (var route in routes) {
      debugPrint(
        "ID: ${route.id}, Name: ${route.name}, Color: ${route.color}, Height: ${route.height}, UserID: ${route.userId}, Backend id: ${route.backendId}"
      );
    }
  }
}
Future<void> markRouteAsUploaded(int localId, int backendId) async {
  await (_db.update(_db.climbingRoutes)
        ..where((t) => t.id.equals(localId)))
      .write(ClimbingRoutesCompanion(
        backendId: Value(backendId),
        isAddedToBackend: Value(true),
      ));
}
Future<void> markRouteAsToDeletion(int localId) async {
  await (_db.update(_db.climbingRoutes)
        ..where((t) => t.id.equals(localId)))
      .write(ClimbingRoutesCompanion(
        isToDelete: Value(true),
      ));
}

Future<void> removeRoute(int localId) async{
  await (_db.delete(_db.climbingRoutes)..where((r) => r.id.equals(localId))).go();
}

Stream<List<ClimbingRoute>> watchAllRoutes() {
  return _db.select(_db.climbingRoutes).watch();
}

Stream<List<ClimbingRoute>> watchAllRoutesWithoutToDelete() {
  return (_db.select(_db.climbingRoutes)
        ..where((t) => t.isToDelete.equals(false) | t.isToDelete.isNull()))
      .watch();
}

}
