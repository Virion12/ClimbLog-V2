import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:drift/drift.dart';

class StreakService {
  final AppDatabase _db;
  final AuthService _authService;

  StreakService(this._db,this._authService);

  Future<String> _getUserId() async {
  final userId = await _authService.getUserId();
  if (userId == null) {
    throw Exception("User ID not found. User might not be logged in.");
  }
  return userId;
  }


  Future<Streak?> GetStreak() async{
    final userId = await _getUserId();
    if(userId.isEmpty){
      throw Exception("No userID");
    }
    return (_db.select(_db.streaks)..where((s) => s.userId.equals(int.parse(userId)))).getSingleOrNull();
  }

  Future<int> StartStreak() async{
    final userId = await _getUserId();
    if(userId.isEmpty){
      throw Exception("No userID");
    }

   final newId =  await _db.into(_db.streaks).insert(StreaksCompanion(
      backendId: Value(0),
      userId: Value(int.parse(userId)),
      counter: Value(1),
    ));
    return newId;
  }
  Future<void> ResetStreak(int id) async{
    await (_db.update(_db.streaks)..where((s)=> s.id.equals(id))).write(StreaksCompanion(
      lastUpdatedAt: Value(DateTime.now()),
      startOfStreak: Value(DateTime.now()),
      counter: Value(1),
    ));
  }
  Stream<Streak?> watchUserStreak() async* {
  final userId = await _getUserId();
  if (userId.isEmpty) throw Exception("No userID");

  yield* (_db.select(_db.streaks)
        ..where((s) => s.userId.equals(int.parse(userId))))
      .watchSingleOrNull();
}

  Future<void> incrementStreak(int id) async {
  await _db.customUpdate(
    'UPDATE streaks SET counter = counter + 1, last_updated_at = ? WHERE id = ?',
    variables: [Variable(DateTime.now()), Variable(id)],
    updates: {_db.streaks}, 
  );
}

 Future<void> ManageStreak() async {
  final userId = await _getUserId();
  if (userId.isEmpty) throw Exception("No userID");

  final userStreak = await GetStreak();

  if (userStreak == null) {
    await StartStreak();
    return;
  }

  final now = DateTime.now();
  final last = userStreak.lastUpdatedAt;

  final differenceInDays = now.difference(last).inDays;

  if (differenceInDays == 0) {
    return;
  } else if (differenceInDays == 1) {
    await incrementStreak(userStreak.id);
  } else if (differenceInDays > 1) {
    await ResetStreak(userStreak.id);
  }
}
}