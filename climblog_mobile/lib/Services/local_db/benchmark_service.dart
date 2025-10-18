import 'package:climblog_mobile/database/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BenchmarkService {
  final _storage = const FlutterSecureStorage();
  final AppDatabase _db;

  BenchmarkService(this._db);

  //add
  Future<int> Addbenchmark({
    required double body_weight,
    required int ex1_points,
    required int ex2_points,
    required int ex3_points,
    required int ex4_points,
  })async{
    final userID = await _storage.read(key: "userid");
      if (userID == null) {
        throw Exception("User is not logged in");
      }
      final userIdToInt = int.parse(userID);
      final newId = await _db.into(_db.benchmarks).insert(BenchmarksCompanion.insert
      (backendId: 0, userId:userIdToInt , 
      bodyWeight: body_weight, ex1Points: ex1_points, 
      ex2Points: ex2_points, ex3Points: ex3_points, 
      ex4Points: ex4_points, createdAt: Value(DateTime.now()),
      ));
      return newId;
  }

  //remove
  Future<bool> RemoveBenchmark(int id) async{
    try{
    await (_db.delete(_db.benchmarks)..where((b) => b.id.equals(id))).go();
    return true;
    }catch (e){
      return false;
    }
  }

Future<void> ToogleToDelete(int id) async{
  await (_db.update(_db.benchmarks)..where((b) => b.id.equals(id)))
  .write(
    BenchmarksCompanion(
      isToDelete: Value(true),
    )
  );
}


Future<void> ToogleThatItIsInBackend(int id,int backendId) async{
  await (_db.update(_db.benchmarks)..where((b) => b.id.equals(id)))
  .write(
    BenchmarksCompanion(
      isAddedToBackend: Value(true),
      backendId: Value(backendId),
    )
  );
}

// Get all
Stream<List<Benchmark>> getAll(int userId) {
  return (_db.select(_db.benchmarks)
    ..where((b) => b.userId.equals(userId))
    ..orderBy([(b) => OrderingTerm.desc(b.createdAt)]))
    .watch();
}

Stream<List<Benchmark>> getAllWithoutToDelete(int userId) {
  return (_db.select(_db.benchmarks)
    ..where((b) => b.userId.equals(userId) & b.isToDelete.equals(false))
    ..orderBy([(b) => OrderingTerm.desc(b.createdAt)]))
    .watch();
}

//GetOne
Future<Benchmark> getOne(int localId) async {
  final userID = await _storage.read(key: "userid");
  if (userID == null) {
    throw Exception("User is not logged in");
  }
  final userIdToInt = int.parse(userID);

  return (_db.select(_db.benchmarks)
  ..where((b) => b.id.equals(localId) & b.userId.equals(userIdToInt))).getSingle();
}


  
}