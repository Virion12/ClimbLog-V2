import 'package:drift/drift.dart';

class Benchmarks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get backendId => integer()();
  IntColumn get userId => integer().named('user_id')();
  RealColumn get bodyWeight => real().named('body_weight')();
  IntColumn get ex1Points => integer().named('ex1_points')();
  IntColumn get ex2Points => integer().named('ex2_points')();
  IntColumn get ex3Points => integer().named('ex3_points')();
  IntColumn get ex4Points => integer().named('ex4_points')();
  BoolColumn get isToDelete => boolean().withDefault(Constant(false))();
  BoolColumn get isAddedToBackend => boolean().withDefault(Constant(false))();
  DateTimeColumn get createdAt => dateTime().named('created_at').withDefault(currentDateAndTime)();
}