import 'package:drift/drift.dart';

class Streaks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get backendId => integer()();
  IntColumn get userId => integer().named('user_id')();
  IntColumn get counter => integer()();
  DateTimeColumn get lastUpdatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get startOfStreak => dateTime().withDefault(currentDateAndTime)();
}