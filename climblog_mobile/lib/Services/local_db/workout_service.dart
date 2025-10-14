import 'package:drift/drift.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WorkoutService {
  final AppDatabase _db = AppDatabase();
  final _storage = const FlutterSecureStorage();
  
  Future<int> addWorkoutPlan({
    
    required String name,
    bool isPublic = false,
    String imagePath = '',
    List<WorkoutDayInput>? days,
  }) async {
    final userID = await _storage.read(key: "userid");
      if (userID == null) {
        throw Exception("User is not logged in");
      }
    final userIdToInt = int.parse(userID);
    
    return await _db.transaction(() async {
      
      final planId = await _db.into(_db.workoutPlans).insert(
            WorkoutPlansCompanion.insert(
              userId: userIdToInt,
              name: Value(name),
              isPublic: Value(isPublic),
              imagePath: Value(imagePath),
            ),
          );

      
      if (days != null) {
        for (final day in days) {
          final dayId = await _db.into(_db.workoutDays).insert(
                WorkoutDaysCompanion.insert(
                  workoutPlanId: planId,
                  workoutDayOfWeek: Value(day.dayOfWeek),
                ),
              );

        
          for (final session in day.sessions) {
            final sessionId = await _db.into(_db.workoutSessions).insert(
                  WorkoutSessionsCompanion.insert(
                    workoutDayId: dayId,
                    name: Value(session.name),
                    location: Value(session.location ?? 'Default'),
                    start: Value(session.start ?? '00:00'),
                  ),
                );

            
            for (final ex in session.exercises) {
              await _db.into(_db.exercises).insert(
                    ExercisesCompanion.insert(
                      workoutSessionId: sessionId,
                      name: Value(ex.name),
                      time: Value(ex.time ?? 0),
                      breakTime: Value(ex.breakTime ?? 0),
                      setNumber: Value(ex.setNumber ?? 0),
                      repNumber: Value(ex.repNumber ?? 0),
                    ),
                  );
            }
          }
        }
      }

      return planId;
    });
  }

  Future<void> removeWorkoutPlan(int planId) async {
    await _db.transaction(() async {
      final days = await (_db.select(_db.workoutDays)
            ..where((tbl) => tbl.workoutPlanId.equals(planId)))
          .get();

      for (final day in days) {
        final sessions = await (_db.select(_db.workoutSessions)
              ..where((tbl) => tbl.workoutDayId.equals(day.id)))
            .get();

        for (final session in sessions) {
          await (_db.delete(_db.exercises)
                ..where((tbl) => tbl.workoutSessionId.equals(session.id)))
              .go();
        }

        await (_db.delete(_db.workoutSessions)
              ..where((tbl) => tbl.workoutDayId.equals(day.id)))
            .go();
      }

      await (_db.delete(_db.workoutDays)
            ..where((tbl) => tbl.workoutPlanId.equals(planId)))
          .go();

      await (_db.delete(_db.workoutPlans)
            ..where((tbl) => tbl.id.equals(planId)))
          .go();
    });
  }

  Stream<List<WorkoutPlanFull>> watchAllWorkoutPlans() {
    return _db.select(_db.workoutPlans).watch().asyncMap((plans) async {
      List<WorkoutPlanFull> result = [];

      for (final plan in plans) {
        final days = await (_db.select(_db.workoutDays)
              ..where((tbl) => tbl.workoutPlanId.equals(plan.id)))
            .get();

        final dayList = <WorkoutDayFull>[];

        for (final day in days) {
          final sessions = await (_db.select(_db.workoutSessions)
                ..where((tbl) => tbl.workoutDayId.equals(day.id)))
              .get();

          final sessionList = <WorkoutSessionFull>[];

          for (final session in sessions) {
            final exercises = await (_db.select(_db.exercises)
                  ..where((tbl) => tbl.workoutSessionId.equals(session.id)))
                .get();

            sessionList.add(WorkoutSessionFull(
              session: session,
              exercises: exercises,
            ));
          }

          dayList.add(WorkoutDayFull(
            day: day,
            sessions: sessionList,
          ));
        }

        result.add(WorkoutPlanFull(
          plan: plan,
          days: dayList,
        ));
      }

      return result;
    });
  }

  Future<bool> toogleIsMain(int id) async{
   
    await _db.update(_db.workoutPlans).write(const WorkoutPlansCompanion(isMain : Value(false)));
    
    await (_db.update(_db.workoutPlans)..where((t) => t.id.equals(id))).write(WorkoutPlansCompanion(isMain: const Value(true)));
    return true;
  }

  Future<List<WorkoutPlanFull>> getAllWorkoutPlans() async {
    final plans = await _db.select(_db.workoutPlans).get();

    List<WorkoutPlanFull> result = [];

    for (final plan in plans) {
      final days = await (_db.select(_db.workoutDays)
            ..where((tbl) => tbl.workoutPlanId.equals(plan.id)))
          .get();

      final dayList = <WorkoutDayFull>[];

      for (final day in days) {
        final sessions = await (_db.select(_db.workoutSessions)
              ..where((tbl) => tbl.workoutDayId.equals(day.id)))
            .get();

        final sessionList = <WorkoutSessionFull>[];

        for (final session in sessions) {
          final exercises = await (_db.select(_db.exercises)
                ..where((tbl) => tbl.workoutSessionId.equals(session.id)))
              .get();

          sessionList.add(WorkoutSessionFull(
            session: session,
            exercises: exercises,
          ));
        }

        dayList.add(WorkoutDayFull(
          day: day,
          sessions: sessionList,
        ));
      }

      result.add(WorkoutPlanFull(
        plan: plan,
        days: dayList,
      ));
    }

    return result;
  }
}

class WorkoutPlanFull {
  final WorkoutPlan plan;
  final List<WorkoutDayFull> days;

  WorkoutPlanFull({
    required this.plan,
    required this.days,
  });
}

class WorkoutDayFull {
  final WorkoutDay day;
  final List<WorkoutSessionFull> sessions;

  WorkoutDayFull({
    required this.day,
    required this.sessions,
  });
}

class WorkoutSessionFull {
  final WorkoutSession session;
  final List<Exercise> exercises;

  WorkoutSessionFull({
    required this.session,
    required this.exercises,
  });
}

class WorkoutDayInput {
  final int dayOfWeek; 
  final List<WorkoutSessionInput> sessions;

  WorkoutDayInput({
    required this.dayOfWeek,
    this.sessions = const [],
  });
}

class WorkoutSessionInput {
  final String name;
  final String? location;
  final String? start;
  final List<ExerciseInput> exercises;

  WorkoutSessionInput({
    required this.name,
    this.location,
    this.start,
    this.exercises = const [],
  });
}

class ExerciseInput {
  final String name;
  final double? time;
  final double? breakTime;
  final int? setNumber;
  final int? repNumber;

  ExerciseInput({
    required this.name,
    this.time,
    this.breakTime,
    this.setNumber,
    this.repNumber,
  });
}