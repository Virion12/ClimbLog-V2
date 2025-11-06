import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:climblog_mobile/Riverpod/helpers_riverpod.dart';
import 'package:climblog_mobile/Services/local_db/streak_service.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streakServiceProvider = Provider<StreakService>((ref) {
  final db = ref.watch(dbProvider);
  final auth = ref.watch(authServiceProvider);
  return StreakService(db, auth);
});
final streakProvider = StreamProvider.autoDispose<Streak?>((ref) {
  final streakService = ref.watch(streakServiceProvider);
  return streakService.watchUserStreak();
});
