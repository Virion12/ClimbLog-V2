import 'package:drift/drift.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; 

class RouteService {
  final _storage = const FlutterSecureStorage();
  final AppDatabase _db;

  RouteService(this._db);

  Future<int> addRoute({
    required int id,
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
    if(userID == null){
      throw Exception("User is not logged in ");
    }
    final userIdToInt = int.parse(userID);

    return await _db.into(_db.climbingRoutes).insert(
          ClimbingRoutesCompanion.insert(
            id: Value(id),
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
  }
  Future<void> printAllRoutes() async {
  final routes = await _db.select(_db.climbingRoutes).get();

  if (routes.isEmpty) {
    debugPrint("Brak dróg w bazie.");
  } else {
    for (var route in routes) {
      debugPrint(
        "ID: ${route.id}, Name: ${route.name}, Color: ${route.color}, Height: ${route.height}, UserID: ${route.userId}"
      );
    }
  }
}
}
