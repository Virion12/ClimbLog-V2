// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ClimbingRoutesTable extends ClimbingRoutes
    with TableInfo<$ClimbingRoutesTable, ClimbingRoute> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClimbingRoutesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _backendIdMeta = const VerificationMeta(
    'backendId',
  );
  @override
  late final GeneratedColumn<int> backendId = GeneratedColumn<int>(
    'backend_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isPublicMeta = const VerificationMeta(
    'isPublic',
  );
  @override
  late final GeneratedColumn<bool> isPublic = GeneratedColumn<bool>(
    'is_public',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_public" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _isPoweryMeta = const VerificationMeta(
    'isPowery',
  );
  @override
  late final GeneratedColumn<bool> isPowery = GeneratedColumn<bool>(
    'is_powery',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_powery" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isSloppyMeta = const VerificationMeta(
    'isSloppy',
  );
  @override
  late final GeneratedColumn<bool> isSloppy = GeneratedColumn<bool>(
    'is_sloppy',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_sloppy" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isDynamicMeta = const VerificationMeta(
    'isDynamic',
  );
  @override
  late final GeneratedColumn<bool> isDynamic = GeneratedColumn<bool>(
    'is_dynamic',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_dynamic" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isCrimpyMeta = const VerificationMeta(
    'isCrimpy',
  );
  @override
  late final GeneratedColumn<bool> isCrimpy = GeneratedColumn<bool>(
    'is_crimpy',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_crimpy" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isReachyMeta = const VerificationMeta(
    'isReachy',
  );
  @override
  late final GeneratedColumn<bool> isReachy = GeneratedColumn<bool>(
    'is_reachy',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_reachy" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isOnsightedMeta = const VerificationMeta(
    'isOnsighted',
  );
  @override
  late final GeneratedColumn<bool> isOnsighted = GeneratedColumn<bool>(
    'is_onsighted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_onsighted" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isRedPointedMeta = const VerificationMeta(
    'isRedPointed',
  );
  @override
  late final GeneratedColumn<bool> isRedPointed = GeneratedColumn<bool>(
    'is_red_pointed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_red_pointed" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isFlashedMeta = const VerificationMeta(
    'isFlashed',
  );
  @override
  late final GeneratedColumn<bool> isFlashed = GeneratedColumn<bool>(
    'is_flashed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_flashed" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _numberOfTriedMeta = const VerificationMeta(
    'numberOfTried',
  );
  @override
  late final GeneratedColumn<int> numberOfTried = GeneratedColumn<int>(
    'number_of_tried',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(0),
  );
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
    'is_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_done" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _gradeMeta = const VerificationMeta('grade');
  @override
  late final GeneratedColumn<String> grade = GeneratedColumn<String>(
    'grade',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant('4a'),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant(''),
  );
  static const VerificationMeta _thumbnailPathMeta = const VerificationMeta(
    'thumbnailPath',
  );
  @override
  late final GeneratedColumn<String> thumbnailPath = GeneratedColumn<String>(
    'thumbnail_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _isToUpdateMeta = const VerificationMeta(
    'isToUpdate',
  );
  @override
  late final GeneratedColumn<bool> isToUpdate = GeneratedColumn<bool>(
    'is_to_update',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_to_update" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isToDeleteMeta = const VerificationMeta(
    'isToDelete',
  );
  @override
  late final GeneratedColumn<bool> isToDelete = GeneratedColumn<bool>(
    'is_to_delete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_to_delete" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _isAddedToBackendMeta = const VerificationMeta(
    'isAddedToBackend',
  );
  @override
  late final GeneratedColumn<bool> isAddedToBackend = GeneratedColumn<bool>(
    'is_added_to_backend',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_added_to_backend" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    backendId,
    userId,
    isPublic,
    name,
    color,
    height,
    isPowery,
    isSloppy,
    isDynamic,
    isCrimpy,
    isReachy,
    isOnsighted,
    isRedPointed,
    isFlashed,
    isFavorite,
    numberOfTried,
    isDone,
    grade,
    imagePath,
    thumbnailPath,
    createdAt,
    lastUpdatedAt,
    isToUpdate,
    isToDelete,
    isAddedToBackend,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'climbing_routes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClimbingRoute> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('backend_id')) {
      context.handle(
        _backendIdMeta,
        backendId.isAcceptableOrUnknown(data['backend_id']!, _backendIdMeta),
      );
    } else if (isInserting) {
      context.missing(_backendIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('is_public')) {
      context.handle(
        _isPublicMeta,
        isPublic.isAcceptableOrUnknown(data['is_public']!, _isPublicMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('is_powery')) {
      context.handle(
        _isPoweryMeta,
        isPowery.isAcceptableOrUnknown(data['is_powery']!, _isPoweryMeta),
      );
    }
    if (data.containsKey('is_sloppy')) {
      context.handle(
        _isSloppyMeta,
        isSloppy.isAcceptableOrUnknown(data['is_sloppy']!, _isSloppyMeta),
      );
    }
    if (data.containsKey('is_dynamic')) {
      context.handle(
        _isDynamicMeta,
        isDynamic.isAcceptableOrUnknown(data['is_dynamic']!, _isDynamicMeta),
      );
    }
    if (data.containsKey('is_crimpy')) {
      context.handle(
        _isCrimpyMeta,
        isCrimpy.isAcceptableOrUnknown(data['is_crimpy']!, _isCrimpyMeta),
      );
    }
    if (data.containsKey('is_reachy')) {
      context.handle(
        _isReachyMeta,
        isReachy.isAcceptableOrUnknown(data['is_reachy']!, _isReachyMeta),
      );
    }
    if (data.containsKey('is_onsighted')) {
      context.handle(
        _isOnsightedMeta,
        isOnsighted.isAcceptableOrUnknown(
          data['is_onsighted']!,
          _isOnsightedMeta,
        ),
      );
    }
    if (data.containsKey('is_red_pointed')) {
      context.handle(
        _isRedPointedMeta,
        isRedPointed.isAcceptableOrUnknown(
          data['is_red_pointed']!,
          _isRedPointedMeta,
        ),
      );
    }
    if (data.containsKey('is_flashed')) {
      context.handle(
        _isFlashedMeta,
        isFlashed.isAcceptableOrUnknown(data['is_flashed']!, _isFlashedMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('number_of_tried')) {
      context.handle(
        _numberOfTriedMeta,
        numberOfTried.isAcceptableOrUnknown(
          data['number_of_tried']!,
          _numberOfTriedMeta,
        ),
      );
    }
    if (data.containsKey('is_done')) {
      context.handle(
        _isDoneMeta,
        isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta),
      );
    }
    if (data.containsKey('grade')) {
      context.handle(
        _gradeMeta,
        grade.isAcceptableOrUnknown(data['grade']!, _gradeMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('thumbnail_path')) {
      context.handle(
        _thumbnailPathMeta,
        thumbnailPath.isAcceptableOrUnknown(
          data['thumbnail_path']!,
          _thumbnailPathMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('is_to_update')) {
      context.handle(
        _isToUpdateMeta,
        isToUpdate.isAcceptableOrUnknown(
          data['is_to_update']!,
          _isToUpdateMeta,
        ),
      );
    }
    if (data.containsKey('is_to_delete')) {
      context.handle(
        _isToDeleteMeta,
        isToDelete.isAcceptableOrUnknown(
          data['is_to_delete']!,
          _isToDeleteMeta,
        ),
      );
    }
    if (data.containsKey('is_added_to_backend')) {
      context.handle(
        _isAddedToBackendMeta,
        isAddedToBackend.isAcceptableOrUnknown(
          data['is_added_to_backend']!,
          _isAddedToBackendMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClimbingRoute map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClimbingRoute(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      backendId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}backend_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      isPublic: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_public'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      )!,
      isPowery: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_powery'],
      )!,
      isSloppy: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_sloppy'],
      )!,
      isDynamic: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_dynamic'],
      )!,
      isCrimpy: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_crimpy'],
      )!,
      isReachy: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_reachy'],
      )!,
      isOnsighted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_onsighted'],
      )!,
      isRedPointed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_red_pointed'],
      )!,
      isFlashed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_flashed'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      numberOfTried: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_tried'],
      )!,
      isDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_done'],
      )!,
      grade: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grade'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
      thumbnailPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_path'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      )!,
      isToUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_to_update'],
      )!,
      isToDelete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_to_delete'],
      )!,
      isAddedToBackend: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_added_to_backend'],
      )!,
    );
  }

  @override
  $ClimbingRoutesTable createAlias(String alias) {
    return $ClimbingRoutesTable(attachedDatabase, alias);
  }
}

class ClimbingRoute extends DataClass implements Insertable<ClimbingRoute> {
  final int id;
  final int backendId;
  final int userId;
  final bool isPublic;
  final String name;
  final String color;
  final double height;
  final bool isPowery;
  final bool isSloppy;
  final bool isDynamic;
  final bool isCrimpy;
  final bool isReachy;
  final bool isOnsighted;
  final bool isRedPointed;
  final bool isFlashed;
  final bool isFavorite;
  final int numberOfTried;
  final bool isDone;
  final String grade;
  final String imagePath;
  final String thumbnailPath;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;
  final bool isToUpdate;
  final bool isToDelete;
  final bool isAddedToBackend;
  const ClimbingRoute({
    required this.id,
    required this.backendId,
    required this.userId,
    required this.isPublic,
    required this.name,
    required this.color,
    required this.height,
    required this.isPowery,
    required this.isSloppy,
    required this.isDynamic,
    required this.isCrimpy,
    required this.isReachy,
    required this.isOnsighted,
    required this.isRedPointed,
    required this.isFlashed,
    required this.isFavorite,
    required this.numberOfTried,
    required this.isDone,
    required this.grade,
    required this.imagePath,
    required this.thumbnailPath,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.isToUpdate,
    required this.isToDelete,
    required this.isAddedToBackend,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['backend_id'] = Variable<int>(backendId);
    map['user_id'] = Variable<int>(userId);
    map['is_public'] = Variable<bool>(isPublic);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<String>(color);
    map['height'] = Variable<double>(height);
    map['is_powery'] = Variable<bool>(isPowery);
    map['is_sloppy'] = Variable<bool>(isSloppy);
    map['is_dynamic'] = Variable<bool>(isDynamic);
    map['is_crimpy'] = Variable<bool>(isCrimpy);
    map['is_reachy'] = Variable<bool>(isReachy);
    map['is_onsighted'] = Variable<bool>(isOnsighted);
    map['is_red_pointed'] = Variable<bool>(isRedPointed);
    map['is_flashed'] = Variable<bool>(isFlashed);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['number_of_tried'] = Variable<int>(numberOfTried);
    map['is_done'] = Variable<bool>(isDone);
    map['grade'] = Variable<String>(grade);
    map['image_path'] = Variable<String>(imagePath);
    map['thumbnail_path'] = Variable<String>(thumbnailPath);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt);
    map['is_to_update'] = Variable<bool>(isToUpdate);
    map['is_to_delete'] = Variable<bool>(isToDelete);
    map['is_added_to_backend'] = Variable<bool>(isAddedToBackend);
    return map;
  }

  ClimbingRoutesCompanion toCompanion(bool nullToAbsent) {
    return ClimbingRoutesCompanion(
      id: Value(id),
      backendId: Value(backendId),
      userId: Value(userId),
      isPublic: Value(isPublic),
      name: Value(name),
      color: Value(color),
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
      createdAt: Value(createdAt),
      lastUpdatedAt: Value(lastUpdatedAt),
      isToUpdate: Value(isToUpdate),
      isToDelete: Value(isToDelete),
      isAddedToBackend: Value(isAddedToBackend),
    );
  }

  factory ClimbingRoute.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClimbingRoute(
      id: serializer.fromJson<int>(json['id']),
      backendId: serializer.fromJson<int>(json['backendId']),
      userId: serializer.fromJson<int>(json['userId']),
      isPublic: serializer.fromJson<bool>(json['isPublic']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String>(json['color']),
      height: serializer.fromJson<double>(json['height']),
      isPowery: serializer.fromJson<bool>(json['isPowery']),
      isSloppy: serializer.fromJson<bool>(json['isSloppy']),
      isDynamic: serializer.fromJson<bool>(json['isDynamic']),
      isCrimpy: serializer.fromJson<bool>(json['isCrimpy']),
      isReachy: serializer.fromJson<bool>(json['isReachy']),
      isOnsighted: serializer.fromJson<bool>(json['isOnsighted']),
      isRedPointed: serializer.fromJson<bool>(json['isRedPointed']),
      isFlashed: serializer.fromJson<bool>(json['isFlashed']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      numberOfTried: serializer.fromJson<int>(json['numberOfTried']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      grade: serializer.fromJson<String>(json['grade']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      thumbnailPath: serializer.fromJson<String>(json['thumbnailPath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUpdatedAt: serializer.fromJson<DateTime>(json['lastUpdatedAt']),
      isToUpdate: serializer.fromJson<bool>(json['isToUpdate']),
      isToDelete: serializer.fromJson<bool>(json['isToDelete']),
      isAddedToBackend: serializer.fromJson<bool>(json['isAddedToBackend']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'backendId': serializer.toJson<int>(backendId),
      'userId': serializer.toJson<int>(userId),
      'isPublic': serializer.toJson<bool>(isPublic),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String>(color),
      'height': serializer.toJson<double>(height),
      'isPowery': serializer.toJson<bool>(isPowery),
      'isSloppy': serializer.toJson<bool>(isSloppy),
      'isDynamic': serializer.toJson<bool>(isDynamic),
      'isCrimpy': serializer.toJson<bool>(isCrimpy),
      'isReachy': serializer.toJson<bool>(isReachy),
      'isOnsighted': serializer.toJson<bool>(isOnsighted),
      'isRedPointed': serializer.toJson<bool>(isRedPointed),
      'isFlashed': serializer.toJson<bool>(isFlashed),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'numberOfTried': serializer.toJson<int>(numberOfTried),
      'isDone': serializer.toJson<bool>(isDone),
      'grade': serializer.toJson<String>(grade),
      'imagePath': serializer.toJson<String>(imagePath),
      'thumbnailPath': serializer.toJson<String>(thumbnailPath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUpdatedAt': serializer.toJson<DateTime>(lastUpdatedAt),
      'isToUpdate': serializer.toJson<bool>(isToUpdate),
      'isToDelete': serializer.toJson<bool>(isToDelete),
      'isAddedToBackend': serializer.toJson<bool>(isAddedToBackend),
    };
  }

  ClimbingRoute copyWith({
    int? id,
    int? backendId,
    int? userId,
    bool? isPublic,
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
    String? imagePath,
    String? thumbnailPath,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
    bool? isToUpdate,
    bool? isToDelete,
    bool? isAddedToBackend,
  }) => ClimbingRoute(
    id: id ?? this.id,
    backendId: backendId ?? this.backendId,
    userId: userId ?? this.userId,
    isPublic: isPublic ?? this.isPublic,
    name: name ?? this.name,
    color: color ?? this.color,
    height: height ?? this.height,
    isPowery: isPowery ?? this.isPowery,
    isSloppy: isSloppy ?? this.isSloppy,
    isDynamic: isDynamic ?? this.isDynamic,
    isCrimpy: isCrimpy ?? this.isCrimpy,
    isReachy: isReachy ?? this.isReachy,
    isOnsighted: isOnsighted ?? this.isOnsighted,
    isRedPointed: isRedPointed ?? this.isRedPointed,
    isFlashed: isFlashed ?? this.isFlashed,
    isFavorite: isFavorite ?? this.isFavorite,
    numberOfTried: numberOfTried ?? this.numberOfTried,
    isDone: isDone ?? this.isDone,
    grade: grade ?? this.grade,
    imagePath: imagePath ?? this.imagePath,
    thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    createdAt: createdAt ?? this.createdAt,
    lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    isToUpdate: isToUpdate ?? this.isToUpdate,
    isToDelete: isToDelete ?? this.isToDelete,
    isAddedToBackend: isAddedToBackend ?? this.isAddedToBackend,
  );
  ClimbingRoute copyWithCompanion(ClimbingRoutesCompanion data) {
    return ClimbingRoute(
      id: data.id.present ? data.id.value : this.id,
      backendId: data.backendId.present ? data.backendId.value : this.backendId,
      userId: data.userId.present ? data.userId.value : this.userId,
      isPublic: data.isPublic.present ? data.isPublic.value : this.isPublic,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      height: data.height.present ? data.height.value : this.height,
      isPowery: data.isPowery.present ? data.isPowery.value : this.isPowery,
      isSloppy: data.isSloppy.present ? data.isSloppy.value : this.isSloppy,
      isDynamic: data.isDynamic.present ? data.isDynamic.value : this.isDynamic,
      isCrimpy: data.isCrimpy.present ? data.isCrimpy.value : this.isCrimpy,
      isReachy: data.isReachy.present ? data.isReachy.value : this.isReachy,
      isOnsighted: data.isOnsighted.present
          ? data.isOnsighted.value
          : this.isOnsighted,
      isRedPointed: data.isRedPointed.present
          ? data.isRedPointed.value
          : this.isRedPointed,
      isFlashed: data.isFlashed.present ? data.isFlashed.value : this.isFlashed,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      numberOfTried: data.numberOfTried.present
          ? data.numberOfTried.value
          : this.numberOfTried,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      grade: data.grade.present ? data.grade.value : this.grade,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      thumbnailPath: data.thumbnailPath.present
          ? data.thumbnailPath.value
          : this.thumbnailPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUpdatedAt: data.lastUpdatedAt.present
          ? data.lastUpdatedAt.value
          : this.lastUpdatedAt,
      isToUpdate: data.isToUpdate.present
          ? data.isToUpdate.value
          : this.isToUpdate,
      isToDelete: data.isToDelete.present
          ? data.isToDelete.value
          : this.isToDelete,
      isAddedToBackend: data.isAddedToBackend.present
          ? data.isAddedToBackend.value
          : this.isAddedToBackend,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClimbingRoute(')
          ..write('id: $id, ')
          ..write('backendId: $backendId, ')
          ..write('userId: $userId, ')
          ..write('isPublic: $isPublic, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('height: $height, ')
          ..write('isPowery: $isPowery, ')
          ..write('isSloppy: $isSloppy, ')
          ..write('isDynamic: $isDynamic, ')
          ..write('isCrimpy: $isCrimpy, ')
          ..write('isReachy: $isReachy, ')
          ..write('isOnsighted: $isOnsighted, ')
          ..write('isRedPointed: $isRedPointed, ')
          ..write('isFlashed: $isFlashed, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('numberOfTried: $numberOfTried, ')
          ..write('isDone: $isDone, ')
          ..write('grade: $grade, ')
          ..write('imagePath: $imagePath, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('isToUpdate: $isToUpdate, ')
          ..write('isToDelete: $isToDelete, ')
          ..write('isAddedToBackend: $isAddedToBackend')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    backendId,
    userId,
    isPublic,
    name,
    color,
    height,
    isPowery,
    isSloppy,
    isDynamic,
    isCrimpy,
    isReachy,
    isOnsighted,
    isRedPointed,
    isFlashed,
    isFavorite,
    numberOfTried,
    isDone,
    grade,
    imagePath,
    thumbnailPath,
    createdAt,
    lastUpdatedAt,
    isToUpdate,
    isToDelete,
    isAddedToBackend,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClimbingRoute &&
          other.id == this.id &&
          other.backendId == this.backendId &&
          other.userId == this.userId &&
          other.isPublic == this.isPublic &&
          other.name == this.name &&
          other.color == this.color &&
          other.height == this.height &&
          other.isPowery == this.isPowery &&
          other.isSloppy == this.isSloppy &&
          other.isDynamic == this.isDynamic &&
          other.isCrimpy == this.isCrimpy &&
          other.isReachy == this.isReachy &&
          other.isOnsighted == this.isOnsighted &&
          other.isRedPointed == this.isRedPointed &&
          other.isFlashed == this.isFlashed &&
          other.isFavorite == this.isFavorite &&
          other.numberOfTried == this.numberOfTried &&
          other.isDone == this.isDone &&
          other.grade == this.grade &&
          other.imagePath == this.imagePath &&
          other.thumbnailPath == this.thumbnailPath &&
          other.createdAt == this.createdAt &&
          other.lastUpdatedAt == this.lastUpdatedAt &&
          other.isToUpdate == this.isToUpdate &&
          other.isToDelete == this.isToDelete &&
          other.isAddedToBackend == this.isAddedToBackend);
}

class ClimbingRoutesCompanion extends UpdateCompanion<ClimbingRoute> {
  final Value<int> id;
  final Value<int> backendId;
  final Value<int> userId;
  final Value<bool> isPublic;
  final Value<String> name;
  final Value<String> color;
  final Value<double> height;
  final Value<bool> isPowery;
  final Value<bool> isSloppy;
  final Value<bool> isDynamic;
  final Value<bool> isCrimpy;
  final Value<bool> isReachy;
  final Value<bool> isOnsighted;
  final Value<bool> isRedPointed;
  final Value<bool> isFlashed;
  final Value<bool> isFavorite;
  final Value<int> numberOfTried;
  final Value<bool> isDone;
  final Value<String> grade;
  final Value<String> imagePath;
  final Value<String> thumbnailPath;
  final Value<DateTime> createdAt;
  final Value<DateTime> lastUpdatedAt;
  final Value<bool> isToUpdate;
  final Value<bool> isToDelete;
  final Value<bool> isAddedToBackend;
  const ClimbingRoutesCompanion({
    this.id = const Value.absent(),
    this.backendId = const Value.absent(),
    this.userId = const Value.absent(),
    this.isPublic = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.height = const Value.absent(),
    this.isPowery = const Value.absent(),
    this.isSloppy = const Value.absent(),
    this.isDynamic = const Value.absent(),
    this.isCrimpy = const Value.absent(),
    this.isReachy = const Value.absent(),
    this.isOnsighted = const Value.absent(),
    this.isRedPointed = const Value.absent(),
    this.isFlashed = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.numberOfTried = const Value.absent(),
    this.isDone = const Value.absent(),
    this.grade = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.isToUpdate = const Value.absent(),
    this.isToDelete = const Value.absent(),
    this.isAddedToBackend = const Value.absent(),
  });
  ClimbingRoutesCompanion.insert({
    this.id = const Value.absent(),
    required int backendId,
    required int userId,
    this.isPublic = const Value.absent(),
    required String name,
    required String color,
    this.height = const Value.absent(),
    this.isPowery = const Value.absent(),
    this.isSloppy = const Value.absent(),
    this.isDynamic = const Value.absent(),
    this.isCrimpy = const Value.absent(),
    this.isReachy = const Value.absent(),
    this.isOnsighted = const Value.absent(),
    this.isRedPointed = const Value.absent(),
    this.isFlashed = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.numberOfTried = const Value.absent(),
    this.isDone = const Value.absent(),
    this.grade = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.isToUpdate = const Value.absent(),
    this.isToDelete = const Value.absent(),
    this.isAddedToBackend = const Value.absent(),
  }) : backendId = Value(backendId),
       userId = Value(userId),
       name = Value(name),
       color = Value(color);
  static Insertable<ClimbingRoute> custom({
    Expression<int>? id,
    Expression<int>? backendId,
    Expression<int>? userId,
    Expression<bool>? isPublic,
    Expression<String>? name,
    Expression<String>? color,
    Expression<double>? height,
    Expression<bool>? isPowery,
    Expression<bool>? isSloppy,
    Expression<bool>? isDynamic,
    Expression<bool>? isCrimpy,
    Expression<bool>? isReachy,
    Expression<bool>? isOnsighted,
    Expression<bool>? isRedPointed,
    Expression<bool>? isFlashed,
    Expression<bool>? isFavorite,
    Expression<int>? numberOfTried,
    Expression<bool>? isDone,
    Expression<String>? grade,
    Expression<String>? imagePath,
    Expression<String>? thumbnailPath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<bool>? isToUpdate,
    Expression<bool>? isToDelete,
    Expression<bool>? isAddedToBackend,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (backendId != null) 'backend_id': backendId,
      if (userId != null) 'user_id': userId,
      if (isPublic != null) 'is_public': isPublic,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (height != null) 'height': height,
      if (isPowery != null) 'is_powery': isPowery,
      if (isSloppy != null) 'is_sloppy': isSloppy,
      if (isDynamic != null) 'is_dynamic': isDynamic,
      if (isCrimpy != null) 'is_crimpy': isCrimpy,
      if (isReachy != null) 'is_reachy': isReachy,
      if (isOnsighted != null) 'is_onsighted': isOnsighted,
      if (isRedPointed != null) 'is_red_pointed': isRedPointed,
      if (isFlashed != null) 'is_flashed': isFlashed,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (numberOfTried != null) 'number_of_tried': numberOfTried,
      if (isDone != null) 'is_done': isDone,
      if (grade != null) 'grade': grade,
      if (imagePath != null) 'image_path': imagePath,
      if (thumbnailPath != null) 'thumbnail_path': thumbnailPath,
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (isToUpdate != null) 'is_to_update': isToUpdate,
      if (isToDelete != null) 'is_to_delete': isToDelete,
      if (isAddedToBackend != null) 'is_added_to_backend': isAddedToBackend,
    });
  }

  ClimbingRoutesCompanion copyWith({
    Value<int>? id,
    Value<int>? backendId,
    Value<int>? userId,
    Value<bool>? isPublic,
    Value<String>? name,
    Value<String>? color,
    Value<double>? height,
    Value<bool>? isPowery,
    Value<bool>? isSloppy,
    Value<bool>? isDynamic,
    Value<bool>? isCrimpy,
    Value<bool>? isReachy,
    Value<bool>? isOnsighted,
    Value<bool>? isRedPointed,
    Value<bool>? isFlashed,
    Value<bool>? isFavorite,
    Value<int>? numberOfTried,
    Value<bool>? isDone,
    Value<String>? grade,
    Value<String>? imagePath,
    Value<String>? thumbnailPath,
    Value<DateTime>? createdAt,
    Value<DateTime>? lastUpdatedAt,
    Value<bool>? isToUpdate,
    Value<bool>? isToDelete,
    Value<bool>? isAddedToBackend,
  }) {
    return ClimbingRoutesCompanion(
      id: id ?? this.id,
      backendId: backendId ?? this.backendId,
      userId: userId ?? this.userId,
      isPublic: isPublic ?? this.isPublic,
      name: name ?? this.name,
      color: color ?? this.color,
      height: height ?? this.height,
      isPowery: isPowery ?? this.isPowery,
      isSloppy: isSloppy ?? this.isSloppy,
      isDynamic: isDynamic ?? this.isDynamic,
      isCrimpy: isCrimpy ?? this.isCrimpy,
      isReachy: isReachy ?? this.isReachy,
      isOnsighted: isOnsighted ?? this.isOnsighted,
      isRedPointed: isRedPointed ?? this.isRedPointed,
      isFlashed: isFlashed ?? this.isFlashed,
      isFavorite: isFavorite ?? this.isFavorite,
      numberOfTried: numberOfTried ?? this.numberOfTried,
      isDone: isDone ?? this.isDone,
      grade: grade ?? this.grade,
      imagePath: imagePath ?? this.imagePath,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      isToUpdate: isToUpdate ?? this.isToUpdate,
      isToDelete: isToDelete ?? this.isToDelete,
      isAddedToBackend: isAddedToBackend ?? this.isAddedToBackend,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (backendId.present) {
      map['backend_id'] = Variable<int>(backendId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (isPublic.present) {
      map['is_public'] = Variable<bool>(isPublic.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (isPowery.present) {
      map['is_powery'] = Variable<bool>(isPowery.value);
    }
    if (isSloppy.present) {
      map['is_sloppy'] = Variable<bool>(isSloppy.value);
    }
    if (isDynamic.present) {
      map['is_dynamic'] = Variable<bool>(isDynamic.value);
    }
    if (isCrimpy.present) {
      map['is_crimpy'] = Variable<bool>(isCrimpy.value);
    }
    if (isReachy.present) {
      map['is_reachy'] = Variable<bool>(isReachy.value);
    }
    if (isOnsighted.present) {
      map['is_onsighted'] = Variable<bool>(isOnsighted.value);
    }
    if (isRedPointed.present) {
      map['is_red_pointed'] = Variable<bool>(isRedPointed.value);
    }
    if (isFlashed.present) {
      map['is_flashed'] = Variable<bool>(isFlashed.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (numberOfTried.present) {
      map['number_of_tried'] = Variable<int>(numberOfTried.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (grade.present) {
      map['grade'] = Variable<String>(grade.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (thumbnailPath.present) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (isToUpdate.present) {
      map['is_to_update'] = Variable<bool>(isToUpdate.value);
    }
    if (isToDelete.present) {
      map['is_to_delete'] = Variable<bool>(isToDelete.value);
    }
    if (isAddedToBackend.present) {
      map['is_added_to_backend'] = Variable<bool>(isAddedToBackend.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClimbingRoutesCompanion(')
          ..write('id: $id, ')
          ..write('backendId: $backendId, ')
          ..write('userId: $userId, ')
          ..write('isPublic: $isPublic, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('height: $height, ')
          ..write('isPowery: $isPowery, ')
          ..write('isSloppy: $isSloppy, ')
          ..write('isDynamic: $isDynamic, ')
          ..write('isCrimpy: $isCrimpy, ')
          ..write('isReachy: $isReachy, ')
          ..write('isOnsighted: $isOnsighted, ')
          ..write('isRedPointed: $isRedPointed, ')
          ..write('isFlashed: $isFlashed, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('numberOfTried: $numberOfTried, ')
          ..write('isDone: $isDone, ')
          ..write('grade: $grade, ')
          ..write('imagePath: $imagePath, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('isToUpdate: $isToUpdate, ')
          ..write('isToDelete: $isToDelete, ')
          ..write('isAddedToBackend: $isAddedToBackend')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ClimbingRoutesTable climbingRoutes = $ClimbingRoutesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [climbingRoutes];
}

typedef $$ClimbingRoutesTableCreateCompanionBuilder =
    ClimbingRoutesCompanion Function({
      Value<int> id,
      required int backendId,
      required int userId,
      Value<bool> isPublic,
      required String name,
      required String color,
      Value<double> height,
      Value<bool> isPowery,
      Value<bool> isSloppy,
      Value<bool> isDynamic,
      Value<bool> isCrimpy,
      Value<bool> isReachy,
      Value<bool> isOnsighted,
      Value<bool> isRedPointed,
      Value<bool> isFlashed,
      Value<bool> isFavorite,
      Value<int> numberOfTried,
      Value<bool> isDone,
      Value<String> grade,
      Value<String> imagePath,
      Value<String> thumbnailPath,
      Value<DateTime> createdAt,
      Value<DateTime> lastUpdatedAt,
      Value<bool> isToUpdate,
      Value<bool> isToDelete,
      Value<bool> isAddedToBackend,
    });
typedef $$ClimbingRoutesTableUpdateCompanionBuilder =
    ClimbingRoutesCompanion Function({
      Value<int> id,
      Value<int> backendId,
      Value<int> userId,
      Value<bool> isPublic,
      Value<String> name,
      Value<String> color,
      Value<double> height,
      Value<bool> isPowery,
      Value<bool> isSloppy,
      Value<bool> isDynamic,
      Value<bool> isCrimpy,
      Value<bool> isReachy,
      Value<bool> isOnsighted,
      Value<bool> isRedPointed,
      Value<bool> isFlashed,
      Value<bool> isFavorite,
      Value<int> numberOfTried,
      Value<bool> isDone,
      Value<String> grade,
      Value<String> imagePath,
      Value<String> thumbnailPath,
      Value<DateTime> createdAt,
      Value<DateTime> lastUpdatedAt,
      Value<bool> isToUpdate,
      Value<bool> isToDelete,
      Value<bool> isAddedToBackend,
    });

class $$ClimbingRoutesTableFilterComposer
    extends Composer<_$AppDatabase, $ClimbingRoutesTable> {
  $$ClimbingRoutesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get backendId => $composableBuilder(
    column: $table.backendId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPublic => $composableBuilder(
    column: $table.isPublic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPowery => $composableBuilder(
    column: $table.isPowery,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSloppy => $composableBuilder(
    column: $table.isSloppy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDynamic => $composableBuilder(
    column: $table.isDynamic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCrimpy => $composableBuilder(
    column: $table.isCrimpy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isReachy => $composableBuilder(
    column: $table.isReachy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOnsighted => $composableBuilder(
    column: $table.isOnsighted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRedPointed => $composableBuilder(
    column: $table.isRedPointed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFlashed => $composableBuilder(
    column: $table.isFlashed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfTried => $composableBuilder(
    column: $table.numberOfTried,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get grade => $composableBuilder(
    column: $table.grade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isToUpdate => $composableBuilder(
    column: $table.isToUpdate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isToDelete => $composableBuilder(
    column: $table.isToDelete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAddedToBackend => $composableBuilder(
    column: $table.isAddedToBackend,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ClimbingRoutesTableOrderingComposer
    extends Composer<_$AppDatabase, $ClimbingRoutesTable> {
  $$ClimbingRoutesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get backendId => $composableBuilder(
    column: $table.backendId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPublic => $composableBuilder(
    column: $table.isPublic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPowery => $composableBuilder(
    column: $table.isPowery,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSloppy => $composableBuilder(
    column: $table.isSloppy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDynamic => $composableBuilder(
    column: $table.isDynamic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCrimpy => $composableBuilder(
    column: $table.isCrimpy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isReachy => $composableBuilder(
    column: $table.isReachy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOnsighted => $composableBuilder(
    column: $table.isOnsighted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRedPointed => $composableBuilder(
    column: $table.isRedPointed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFlashed => $composableBuilder(
    column: $table.isFlashed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfTried => $composableBuilder(
    column: $table.numberOfTried,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get grade => $composableBuilder(
    column: $table.grade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isToUpdate => $composableBuilder(
    column: $table.isToUpdate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isToDelete => $composableBuilder(
    column: $table.isToDelete,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAddedToBackend => $composableBuilder(
    column: $table.isAddedToBackend,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClimbingRoutesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClimbingRoutesTable> {
  $$ClimbingRoutesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get backendId =>
      $composableBuilder(column: $table.backendId, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<bool> get isPublic =>
      $composableBuilder(column: $table.isPublic, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<bool> get isPowery =>
      $composableBuilder(column: $table.isPowery, builder: (column) => column);

  GeneratedColumn<bool> get isSloppy =>
      $composableBuilder(column: $table.isSloppy, builder: (column) => column);

  GeneratedColumn<bool> get isDynamic =>
      $composableBuilder(column: $table.isDynamic, builder: (column) => column);

  GeneratedColumn<bool> get isCrimpy =>
      $composableBuilder(column: $table.isCrimpy, builder: (column) => column);

  GeneratedColumn<bool> get isReachy =>
      $composableBuilder(column: $table.isReachy, builder: (column) => column);

  GeneratedColumn<bool> get isOnsighted => $composableBuilder(
    column: $table.isOnsighted,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isRedPointed => $composableBuilder(
    column: $table.isRedPointed,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFlashed =>
      $composableBuilder(column: $table.isFlashed, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<int> get numberOfTried => $composableBuilder(
    column: $table.numberOfTried,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<String> get grade =>
      $composableBuilder(column: $table.grade, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isToUpdate => $composableBuilder(
    column: $table.isToUpdate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isToDelete => $composableBuilder(
    column: $table.isToDelete,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAddedToBackend => $composableBuilder(
    column: $table.isAddedToBackend,
    builder: (column) => column,
  );
}

class $$ClimbingRoutesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClimbingRoutesTable,
          ClimbingRoute,
          $$ClimbingRoutesTableFilterComposer,
          $$ClimbingRoutesTableOrderingComposer,
          $$ClimbingRoutesTableAnnotationComposer,
          $$ClimbingRoutesTableCreateCompanionBuilder,
          $$ClimbingRoutesTableUpdateCompanionBuilder,
          (
            ClimbingRoute,
            BaseReferences<_$AppDatabase, $ClimbingRoutesTable, ClimbingRoute>,
          ),
          ClimbingRoute,
          PrefetchHooks Function()
        > {
  $$ClimbingRoutesTableTableManager(
    _$AppDatabase db,
    $ClimbingRoutesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClimbingRoutesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClimbingRoutesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClimbingRoutesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> backendId = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<bool> isPublic = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> color = const Value.absent(),
                Value<double> height = const Value.absent(),
                Value<bool> isPowery = const Value.absent(),
                Value<bool> isSloppy = const Value.absent(),
                Value<bool> isDynamic = const Value.absent(),
                Value<bool> isCrimpy = const Value.absent(),
                Value<bool> isReachy = const Value.absent(),
                Value<bool> isOnsighted = const Value.absent(),
                Value<bool> isRedPointed = const Value.absent(),
                Value<bool> isFlashed = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> numberOfTried = const Value.absent(),
                Value<bool> isDone = const Value.absent(),
                Value<String> grade = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<String> thumbnailPath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> lastUpdatedAt = const Value.absent(),
                Value<bool> isToUpdate = const Value.absent(),
                Value<bool> isToDelete = const Value.absent(),
                Value<bool> isAddedToBackend = const Value.absent(),
              }) => ClimbingRoutesCompanion(
                id: id,
                backendId: backendId,
                userId: userId,
                isPublic: isPublic,
                name: name,
                color: color,
                height: height,
                isPowery: isPowery,
                isSloppy: isSloppy,
                isDynamic: isDynamic,
                isCrimpy: isCrimpy,
                isReachy: isReachy,
                isOnsighted: isOnsighted,
                isRedPointed: isRedPointed,
                isFlashed: isFlashed,
                isFavorite: isFavorite,
                numberOfTried: numberOfTried,
                isDone: isDone,
                grade: grade,
                imagePath: imagePath,
                thumbnailPath: thumbnailPath,
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                isToUpdate: isToUpdate,
                isToDelete: isToDelete,
                isAddedToBackend: isAddedToBackend,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int backendId,
                required int userId,
                Value<bool> isPublic = const Value.absent(),
                required String name,
                required String color,
                Value<double> height = const Value.absent(),
                Value<bool> isPowery = const Value.absent(),
                Value<bool> isSloppy = const Value.absent(),
                Value<bool> isDynamic = const Value.absent(),
                Value<bool> isCrimpy = const Value.absent(),
                Value<bool> isReachy = const Value.absent(),
                Value<bool> isOnsighted = const Value.absent(),
                Value<bool> isRedPointed = const Value.absent(),
                Value<bool> isFlashed = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> numberOfTried = const Value.absent(),
                Value<bool> isDone = const Value.absent(),
                Value<String> grade = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<String> thumbnailPath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> lastUpdatedAt = const Value.absent(),
                Value<bool> isToUpdate = const Value.absent(),
                Value<bool> isToDelete = const Value.absent(),
                Value<bool> isAddedToBackend = const Value.absent(),
              }) => ClimbingRoutesCompanion.insert(
                id: id,
                backendId: backendId,
                userId: userId,
                isPublic: isPublic,
                name: name,
                color: color,
                height: height,
                isPowery: isPowery,
                isSloppy: isSloppy,
                isDynamic: isDynamic,
                isCrimpy: isCrimpy,
                isReachy: isReachy,
                isOnsighted: isOnsighted,
                isRedPointed: isRedPointed,
                isFlashed: isFlashed,
                isFavorite: isFavorite,
                numberOfTried: numberOfTried,
                isDone: isDone,
                grade: grade,
                imagePath: imagePath,
                thumbnailPath: thumbnailPath,
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                isToUpdate: isToUpdate,
                isToDelete: isToDelete,
                isAddedToBackend: isAddedToBackend,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ClimbingRoutesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClimbingRoutesTable,
      ClimbingRoute,
      $$ClimbingRoutesTableFilterComposer,
      $$ClimbingRoutesTableOrderingComposer,
      $$ClimbingRoutesTableAnnotationComposer,
      $$ClimbingRoutesTableCreateCompanionBuilder,
      $$ClimbingRoutesTableUpdateCompanionBuilder,
      (
        ClimbingRoute,
        BaseReferences<_$AppDatabase, $ClimbingRoutesTable, ClimbingRoute>,
      ),
      ClimbingRoute,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ClimbingRoutesTableTableManager get climbingRoutes =>
      $$ClimbingRoutesTableTableManager(_db, _db.climbingRoutes);
}
