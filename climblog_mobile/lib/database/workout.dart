import 'package:drift/drift.dart';



class WorkoutPlans extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get backendId => integer().nullable()(); 
  IntColumn get userId => integer()();

  BoolColumn get isPublic => boolean().withDefault(const Constant(false))();
  TextColumn get name => text().withDefault(const Constant(''))();
  TextColumn get imagePath => text().withDefault(const Constant(''))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastUpdatedAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isMain => boolean().withDefault(const Constant(false))();
  BoolColumn get isToUpdate => boolean().withDefault(const Constant(false))();
  BoolColumn get isToDelete => boolean().withDefault(const Constant(false))();
  BoolColumn get isAddedToBackend => boolean().withDefault(const Constant(false))();
}


class WorkoutDays extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutPlanId => integer().references(WorkoutPlans, #id, onDelete: KeyAction.cascade)();

  
  IntColumn get workoutDayOfWeek => integer().withDefault(const Constant(1))();
}


class WorkoutSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutDayId => integer().references(WorkoutDays, #id, onDelete: KeyAction.cascade)();

  TextColumn get name => text().withDefault(const Constant(''))();
  TextColumn get location => text().withDefault(const Constant('Default'))();

  TextColumn get start => text().withDefault(const Constant('00:00'))();
}


class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutSessionId => integer().references(WorkoutSessions, #id, onDelete: KeyAction.cascade)();

  TextColumn get name => text().withDefault(const Constant(''))();
  RealColumn get time => real().withDefault(const Constant(0))();
  RealColumn get breakTime => real().withDefault(const Constant(0))();
  IntColumn get setNumber => integer().withDefault(const Constant(0))();
  IntColumn get repNumber => integer().withDefault(const Constant(0))();
}
