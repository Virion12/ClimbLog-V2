import 'package:drift/drift.dart';



class ClimbingRoutes extends Table {
  IntColumn get id => integer().autoIncrement()(); 
  IntColumn get backendId => integer()(); 
  IntColumn get userId => integer()();
  BoolColumn get isPublic => boolean().withDefault(Constant(false))();
  TextColumn get name => text()();
  TextColumn get color => text()();
  RealColumn get height => real().withDefault(Constant(0))();
  BoolColumn get isPowery => boolean().withDefault(Constant(false))();
  BoolColumn get isSloppy => boolean().withDefault(Constant(false))();
  BoolColumn get isDynamic => boolean().withDefault(Constant(false))();
  BoolColumn get isCrimpy => boolean().withDefault(Constant(false))();
  BoolColumn get isReachy => boolean().withDefault(Constant(false))();
  BoolColumn get isOnsighted => boolean().withDefault(Constant(false))();
  BoolColumn get isRedPointed => boolean().withDefault(Constant(false))();
  BoolColumn get isFlashed => boolean().withDefault(Constant(false))();
  BoolColumn get isFavorite => boolean().withDefault(Constant(false))();
  IntColumn get numberOfTried => integer().withDefault(Constant(0))();
  BoolColumn get isDone => boolean().withDefault(Constant(false))();
  TextColumn get grade => text().withDefault(Constant('4a'))();
  TextColumn get imagePathLocal => text().withDefault(Constant(''))();
  TextColumn get imagePathBackend => text().withDefault(Constant(''))();
  TextColumn get thumbnailPath => text().withDefault(Constant(''))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastUpdatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isToUpdate => boolean().withDefault(Constant(false))();
  BoolColumn get isToDelete => boolean().withDefault(Constant(false))();
  BoolColumn get isAddedToBackend => boolean().withDefault(Constant(false))();
  BoolColumn get isImagePendingUpdate => boolean().withDefault(Constant(false))();
}
