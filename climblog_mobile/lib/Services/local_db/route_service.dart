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
  String imagePathLocal = "",
  String imagePathBackend = "",
  String thumbnailPath = "",
  DateTime? createdAt,
  DateTime? lastUpdatedAt,
  bool isToUpdate = false,
  bool isToDelete = false,
  bool isAddedToBackend = false,
  bool isImagePendingUpdate = false,
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
      imagePathLocal: Value(imagePathLocal),
      imagePathBackend: Value(imagePathBackend),
      thumbnailPath: Value(thumbnailPath),
      createdAt: Value(createdAt ?? DateTime.now()),
      lastUpdatedAt: Value(lastUpdatedAt ?? DateTime.now()),
      isToUpdate: Value(isToUpdate),
      isToDelete: Value(isToDelete),
      isAddedToBackend: Value(isAddedToBackend),
      isImagePendingUpdate: Value(isImagePendingUpdate),
    ),
  );

  return newId;
}

Future<bool> updateRoute({
  required int id,
  String? name,
  String? color,
  double? height,
  bool? isPowery,
  bool? isSloppy,
  bool? isDynamic,
  bool? isCrimpy,
  bool? isReachy,
  bool? isOnsighted,
  bool? isRedPointed,
  bool? isFlashed,
  bool? isFavorite,
  int? numberOfTried,
  bool? isDone,
  String? grade,
  String? imagePathLocal,
  String? imagePathBackend,
  String? thumbnailPath,
  DateTime? createdAt,
  bool? isToDelete,
  bool? isAddedToBackend,
  bool? isimageToUpdate,
}) async {
  final route = await (_db.select(_db.climbingRoutes)..where((r) => r.id.equals(id))).getSingleOrNull();
  if (route == null) {
    throw Exception("Route with id $id not found");
  }

  await (_db.update(_db.climbingRoutes)..where((r) => r.id.equals(id))).write(
    ClimbingRoutesCompanion(
      name: name != null ? Value(name) : Value.absent(),
      color: color != null ? Value(color) : Value.absent(),
      height: height != null ? Value(height) : Value.absent(),
      isPowery: isPowery != null ? Value(isPowery) : Value.absent(),
      isSloppy: isSloppy != null ? Value(isSloppy) : Value.absent(),
      isDynamic: isDynamic != null ? Value(isDynamic) : Value.absent(),
      isCrimpy: isCrimpy != null ? Value(isCrimpy) : Value.absent(),
      isReachy: isReachy != null ? Value(isReachy) : Value.absent(),
      isOnsighted: isOnsighted != null ? Value(isOnsighted) : Value.absent(),
      isRedPointed: isRedPointed != null ? Value(isRedPointed) : Value.absent(),
      isFlashed: isFlashed != null ? Value(isFlashed) : Value.absent(),
      isFavorite: isFavorite != null ? Value(isFavorite) : Value.absent(),
      numberOfTried: numberOfTried != null ? Value(numberOfTried) : Value.absent(),
      isDone: isDone != null ? Value(isDone) : Value.absent(),
      grade: grade != null ? Value(grade) : Value.absent(),
      imagePathLocal: imagePathLocal != null ? Value(imagePathLocal) : Value.absent(),
      imagePathBackend: imagePathBackend != null ? Value(imagePathBackend) : Value.absent(),
      thumbnailPath: thumbnailPath != null ? Value(thumbnailPath) : Value.absent(),
      createdAt: createdAt != null ? Value(createdAt) : Value.absent(),
      lastUpdatedAt: Value(DateTime.now()),
      isToUpdate: Value(true),
      isToDelete: isToDelete != null ? Value(isToDelete) : Value.absent(),
      isAddedToBackend: isAddedToBackend != null ? Value(isAddedToBackend) : Value.absent(),
      isImagePendingUpdate: isimageToUpdate != null ? Value(isimageToUpdate) : Value.absent(),
    ),
  );

  return true;
}

  Future<void> printRoute(int id) async {
  final route = await getOne(id);
  
  debugPrint("╔════════════════════════════════════════════════════════════════");
  debugPrint("║ ROUTE DEBUG - ID: $id");
  debugPrint("╠════════════════════════════════════════════════════════════════");
  debugPrint("║ Basic Info:");
  debugPrint("║   ID (local): ${route.id}");
  debugPrint("║   Backend ID: ${route.backendId}");
  debugPrint("║   User ID: ${route.userId}");
  debugPrint("║   Name: ${route.name}");
  debugPrint("║   Color: ${route.color}");
  debugPrint("║   Grade: ${route.grade}");
  debugPrint("║   Height: ${route.height}");
  debugPrint("╠════════════════════════════════════════════════════════════════");
  debugPrint("║ Images:");
  debugPrint("║   imagePathLocal: '${route.imagePathLocal}'");
  debugPrint("║   imagePathBackend: '${route.imagePathBackend}'");
  debugPrint("║   thumbnailPath: '${route.thumbnailPath}'");
  debugPrint("╠════════════════════════════════════════════════════════════════");
  debugPrint("║ Sync Flags:");
  debugPrint("║   isAddedToBackend: ${route.isAddedToBackend}");
  debugPrint("║   isToUpdate: ${route.isToUpdate}");
  debugPrint("║   isToDelete: ${route.isToDelete}");
  debugPrint("║   isImagePendingUpdate: ${route.isImagePendingUpdate}");
  debugPrint("╠════════════════════════════════════════════════════════════════");
  debugPrint("║ Properties:");
  debugPrint("║   isPowery: ${route.isPowery}");
  debugPrint("║   isSloppy: ${route.isSloppy}");
  debugPrint("║   isDynamic: ${route.isDynamic}");
  debugPrint("║   isCrimpy: ${route.isCrimpy}");
  debugPrint("║   isReachy: ${route.isReachy}");
  debugPrint("║   isOnsighted: ${route.isOnsighted}");
  debugPrint("║   isRedPointed: ${route.isRedPointed}");
  debugPrint("║   isFlashed: ${route.isFlashed}");
  debugPrint("║   isFavorite: ${route.isFavorite}");
  debugPrint("║   isDone: ${route.isDone}");
  debugPrint("║   numberOfTried: ${route.numberOfTried}");
  debugPrint("╠════════════════════════════════════════════════════════════════");
  debugPrint("║ Timestamps:");
  debugPrint("║   createdAt: ${route.createdAt}");
  debugPrint("║   lastUpdatedAt: ${route.lastUpdatedAt}");
  debugPrint("╚════════════════════════════════════════════════════════════════");
}
  Future<void> printAllRoutes() async {
  final routes = await _db.select(_db.climbingRoutes).get();

  if (routes.isEmpty) {
    debugPrint("Brak dróg w bazie.");
  } else {
    for (var route in routes) {
      debugPrint(
        "ID: ${route.id}, Name: ${route.name}, Color: ${route.color}, Height: ${route.height}, UserID: ${route.userId}, Backend id: ${route.backendId}, imagePathLocal: ${route.imagePathLocal}, imagePathBackend: ${route.imagePathBackend}"
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
        isToUpdate: Value(false),
      ));
}

Future<void> markRouteAsToDeletion(int localId) async {
  await (_db.update(_db.climbingRoutes)
        ..where((t) => t.id.equals(localId)))
      .write(ClimbingRoutesCompanion(
        isToDelete: Value(true),
      ));
}

Future<void> toggleFavorite(int localId) async {
  await (_db.update(_db.climbingRoutes)
        ..where((t) => t.id.equals(localId)))
      .write(
        ClimbingRoutesCompanion.custom(
          isFavorite: _db.climbingRoutes.isFavorite.not(),
          isToUpdate: const Constant(true),
        ),
      );
}

Future<void> toggleUpdate(int localId) async {
  await (_db.update(_db.climbingRoutes)
        ..where((t) => t.id.equals(localId)))
      .write(
        ClimbingRoutesCompanion.custom(
          isToUpdate: _db.climbingRoutes.isToUpdate.not(),
        ),
      );
}

Future<void> addImagePathLocal(int localId, String imagePathLocal) async {
  await (_db.update(_db.climbingRoutes)
        ..where((t) => t.id.equals(localId)))
      .write(ClimbingRoutesCompanion(
        imagePathLocal: Value(imagePathLocal),
      ));
}

Future<void> addImagePathBackend(int localId, String imagePathBackend) async {
  await (_db.update(_db.climbingRoutes)
        ..where((t) => t.id.equals(localId)))
      .write(ClimbingRoutesCompanion(
        imagePathBackend: Value(imagePathBackend),
      ));
}

Future<void> toogleIsPendingUpdate(int localId, bool toggle) async {
  await (_db.update(_db.climbingRoutes)
        ..where((t) => t.id.equals(localId)))
      .write(ClimbingRoutesCompanion(
        isToUpdate:  Value(toggle),
      ));
}

Future<void> toogleImagePendingUpdate(int localId, bool toggle) async {
  await (_db.update(_db.climbingRoutes)
        ..where((t) => t.id.equals(localId)))
      .write(ClimbingRoutesCompanion(
        isImagePendingUpdate:  Value(toggle),
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

Future<ClimbingRoute> getOne(int id) async{
  final userID = await _storage.read(key: "userid");
  if (userID == null) {
    throw Exception("User is not logged in");
  }
  final userIdToInt = int.parse(userID);
  
  return  (_db.select(_db.climbingRoutes)
          ..where((b) => b.id.equals(id) & b.userId.equals(userIdToInt))).getSingle();
}

Future<List<ClimbingRoute>> getAllToDelete(int userID) {
  return (_db.select(_db.climbingRoutes)
        ..where((t) => t.isToDelete.equals(true) & t.userId.equals(userID)))
      .get();
}

Future<List<ClimbingRoute>> getAllToUpdate(int userID) {
  return (_db.select(_db.climbingRoutes)
        ..where((t) => t.isToUpdate.equals(true) & t.userId.equals(userID) & t.isAddedToBackend.equals(true)))
      .get();
}

Future<List<ClimbingRoute>> getAllToAdd(int userID) {
  return (_db.select(_db.climbingRoutes)
        ..where((t) => t.isAddedToBackend.equals(false) & t.userId.equals(userID)))
      .get();
}

Stream<List<ClimbingRoute>> watchAllRoutesWithoutToDeleteLastCustom(DateTime fromWhen) {
  return (_db.select(_db.climbingRoutes)
        ..where((t) => (t.isToDelete.equals(false) | t.isToDelete.isNull()) & t.createdAt.isBiggerOrEqualValue(fromWhen)))
      .watch();
}

Future<bool> isRouteAddedTobackendValidator(int localId) async{
 final route = await (_db.select(_db.climbingRoutes)..where((r) => r.id.equals(localId))).getSingle();
 if(route.isAddedToBackend && route.backendId != 0){
  return true;
 }
 return false;
}

Future<bool> isImagePathLocalSame(int localId, String filename) async{
 final route = await (_db.select(_db.climbingRoutes)..where((r) => r.id.equals(localId))).getSingle();
 if(route.imagePathLocal == filename){
  return true;
 }
 return false;
}

Future<bool> isImagePathBackendSame(int localId, String filename) async{
 final route = await (_db.select(_db.climbingRoutes)..where((r) => r.id.equals(localId))).getSingle();
 if(route.imagePathBackend == filename){
  return true;
 }
 return false;
}

Stream<List<ClimbingRoute>> getRoutesByDateRange(DateTime startDate, DateTime endDate) {
  return (_db.select(_db.climbingRoutes)
        ..where(
          (t) =>
              t.createdAt.isBiggerOrEqualValue(startDate) &
              t.createdAt.isSmallerOrEqualValue(endDate) &
              (t.isToDelete.equals(false) | t.isToDelete.isNull()),
        ))
      .watch();
}

}