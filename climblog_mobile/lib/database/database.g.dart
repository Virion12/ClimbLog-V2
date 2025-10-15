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
  static const VerificationMeta _isImagePendingUpdateMeta =
      const VerificationMeta('isImagePendingUpdate');
  @override
  late final GeneratedColumn<bool> isImagePendingUpdate = GeneratedColumn<bool>(
    'is_image_pending_update',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_image_pending_update" IN (0, 1))',
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
    isImagePendingUpdate,
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
    if (data.containsKey('is_image_pending_update')) {
      context.handle(
        _isImagePendingUpdateMeta,
        isImagePendingUpdate.isAcceptableOrUnknown(
          data['is_image_pending_update']!,
          _isImagePendingUpdateMeta,
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
      isImagePendingUpdate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_image_pending_update'],
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
  final bool isImagePendingUpdate;
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
    required this.isImagePendingUpdate,
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
    map['is_image_pending_update'] = Variable<bool>(isImagePendingUpdate);
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
      isImagePendingUpdate: Value(isImagePendingUpdate),
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
      isImagePendingUpdate: serializer.fromJson<bool>(
        json['isImagePendingUpdate'],
      ),
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
      'isImagePendingUpdate': serializer.toJson<bool>(isImagePendingUpdate),
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
    bool? isImagePendingUpdate,
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
    isImagePendingUpdate: isImagePendingUpdate ?? this.isImagePendingUpdate,
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
      isImagePendingUpdate: data.isImagePendingUpdate.present
          ? data.isImagePendingUpdate.value
          : this.isImagePendingUpdate,
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
          ..write('isAddedToBackend: $isAddedToBackend, ')
          ..write('isImagePendingUpdate: $isImagePendingUpdate')
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
    isImagePendingUpdate,
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
          other.isAddedToBackend == this.isAddedToBackend &&
          other.isImagePendingUpdate == this.isImagePendingUpdate);
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
  final Value<bool> isImagePendingUpdate;
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
    this.isImagePendingUpdate = const Value.absent(),
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
    this.isImagePendingUpdate = const Value.absent(),
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
    Expression<bool>? isImagePendingUpdate,
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
      if (isImagePendingUpdate != null)
        'is_image_pending_update': isImagePendingUpdate,
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
    Value<bool>? isImagePendingUpdate,
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
      isImagePendingUpdate: isImagePendingUpdate ?? this.isImagePendingUpdate,
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
    if (isImagePendingUpdate.present) {
      map['is_image_pending_update'] = Variable<bool>(
        isImagePendingUpdate.value,
      );
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
          ..write('isAddedToBackend: $isAddedToBackend, ')
          ..write('isImagePendingUpdate: $isImagePendingUpdate')
          ..write(')'))
        .toString();
  }
}

class $WorkoutPlansTable extends WorkoutPlans
    with TableInfo<$WorkoutPlansTable, WorkoutPlan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutPlansTable(this.attachedDatabase, [this._alias]);
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
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
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
    defaultValue: const Constant(''),
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
  static const VerificationMeta _isMainMeta = const VerificationMeta('isMain');
  @override
  late final GeneratedColumn<bool> isMain = GeneratedColumn<bool>(
    'is_main',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_main" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
    defaultValue: const Constant(false),
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
    defaultValue: const Constant(false),
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
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    backendId,
    userId,
    isPublic,
    name,
    imagePath,
    createdAt,
    lastUpdatedAt,
    isMain,
    isToUpdate,
    isToDelete,
    isAddedToBackend,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutPlan> instance, {
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
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
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
    if (data.containsKey('is_main')) {
      context.handle(
        _isMainMeta,
        isMain.isAcceptableOrUnknown(data['is_main']!, _isMainMeta),
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
  WorkoutPlan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutPlan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      backendId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}backend_id'],
      ),
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
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      )!,
      isMain: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_main'],
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
  $WorkoutPlansTable createAlias(String alias) {
    return $WorkoutPlansTable(attachedDatabase, alias);
  }
}

class WorkoutPlan extends DataClass implements Insertable<WorkoutPlan> {
  final int id;
  final int? backendId;
  final int userId;
  final bool isPublic;
  final String name;
  final String imagePath;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;
  final bool isMain;
  final bool isToUpdate;
  final bool isToDelete;
  final bool isAddedToBackend;
  const WorkoutPlan({
    required this.id,
    this.backendId,
    required this.userId,
    required this.isPublic,
    required this.name,
    required this.imagePath,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.isMain,
    required this.isToUpdate,
    required this.isToDelete,
    required this.isAddedToBackend,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || backendId != null) {
      map['backend_id'] = Variable<int>(backendId);
    }
    map['user_id'] = Variable<int>(userId);
    map['is_public'] = Variable<bool>(isPublic);
    map['name'] = Variable<String>(name);
    map['image_path'] = Variable<String>(imagePath);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt);
    map['is_main'] = Variable<bool>(isMain);
    map['is_to_update'] = Variable<bool>(isToUpdate);
    map['is_to_delete'] = Variable<bool>(isToDelete);
    map['is_added_to_backend'] = Variable<bool>(isAddedToBackend);
    return map;
  }

  WorkoutPlansCompanion toCompanion(bool nullToAbsent) {
    return WorkoutPlansCompanion(
      id: Value(id),
      backendId: backendId == null && nullToAbsent
          ? const Value.absent()
          : Value(backendId),
      userId: Value(userId),
      isPublic: Value(isPublic),
      name: Value(name),
      imagePath: Value(imagePath),
      createdAt: Value(createdAt),
      lastUpdatedAt: Value(lastUpdatedAt),
      isMain: Value(isMain),
      isToUpdate: Value(isToUpdate),
      isToDelete: Value(isToDelete),
      isAddedToBackend: Value(isAddedToBackend),
    );
  }

  factory WorkoutPlan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutPlan(
      id: serializer.fromJson<int>(json['id']),
      backendId: serializer.fromJson<int?>(json['backendId']),
      userId: serializer.fromJson<int>(json['userId']),
      isPublic: serializer.fromJson<bool>(json['isPublic']),
      name: serializer.fromJson<String>(json['name']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUpdatedAt: serializer.fromJson<DateTime>(json['lastUpdatedAt']),
      isMain: serializer.fromJson<bool>(json['isMain']),
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
      'backendId': serializer.toJson<int?>(backendId),
      'userId': serializer.toJson<int>(userId),
      'isPublic': serializer.toJson<bool>(isPublic),
      'name': serializer.toJson<String>(name),
      'imagePath': serializer.toJson<String>(imagePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUpdatedAt': serializer.toJson<DateTime>(lastUpdatedAt),
      'isMain': serializer.toJson<bool>(isMain),
      'isToUpdate': serializer.toJson<bool>(isToUpdate),
      'isToDelete': serializer.toJson<bool>(isToDelete),
      'isAddedToBackend': serializer.toJson<bool>(isAddedToBackend),
    };
  }

  WorkoutPlan copyWith({
    int? id,
    Value<int?> backendId = const Value.absent(),
    int? userId,
    bool? isPublic,
    String? name,
    String? imagePath,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
    bool? isMain,
    bool? isToUpdate,
    bool? isToDelete,
    bool? isAddedToBackend,
  }) => WorkoutPlan(
    id: id ?? this.id,
    backendId: backendId.present ? backendId.value : this.backendId,
    userId: userId ?? this.userId,
    isPublic: isPublic ?? this.isPublic,
    name: name ?? this.name,
    imagePath: imagePath ?? this.imagePath,
    createdAt: createdAt ?? this.createdAt,
    lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    isMain: isMain ?? this.isMain,
    isToUpdate: isToUpdate ?? this.isToUpdate,
    isToDelete: isToDelete ?? this.isToDelete,
    isAddedToBackend: isAddedToBackend ?? this.isAddedToBackend,
  );
  WorkoutPlan copyWithCompanion(WorkoutPlansCompanion data) {
    return WorkoutPlan(
      id: data.id.present ? data.id.value : this.id,
      backendId: data.backendId.present ? data.backendId.value : this.backendId,
      userId: data.userId.present ? data.userId.value : this.userId,
      isPublic: data.isPublic.present ? data.isPublic.value : this.isPublic,
      name: data.name.present ? data.name.value : this.name,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUpdatedAt: data.lastUpdatedAt.present
          ? data.lastUpdatedAt.value
          : this.lastUpdatedAt,
      isMain: data.isMain.present ? data.isMain.value : this.isMain,
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
    return (StringBuffer('WorkoutPlan(')
          ..write('id: $id, ')
          ..write('backendId: $backendId, ')
          ..write('userId: $userId, ')
          ..write('isPublic: $isPublic, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('isMain: $isMain, ')
          ..write('isToUpdate: $isToUpdate, ')
          ..write('isToDelete: $isToDelete, ')
          ..write('isAddedToBackend: $isAddedToBackend')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    backendId,
    userId,
    isPublic,
    name,
    imagePath,
    createdAt,
    lastUpdatedAt,
    isMain,
    isToUpdate,
    isToDelete,
    isAddedToBackend,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutPlan &&
          other.id == this.id &&
          other.backendId == this.backendId &&
          other.userId == this.userId &&
          other.isPublic == this.isPublic &&
          other.name == this.name &&
          other.imagePath == this.imagePath &&
          other.createdAt == this.createdAt &&
          other.lastUpdatedAt == this.lastUpdatedAt &&
          other.isMain == this.isMain &&
          other.isToUpdate == this.isToUpdate &&
          other.isToDelete == this.isToDelete &&
          other.isAddedToBackend == this.isAddedToBackend);
}

class WorkoutPlansCompanion extends UpdateCompanion<WorkoutPlan> {
  final Value<int> id;
  final Value<int?> backendId;
  final Value<int> userId;
  final Value<bool> isPublic;
  final Value<String> name;
  final Value<String> imagePath;
  final Value<DateTime> createdAt;
  final Value<DateTime> lastUpdatedAt;
  final Value<bool> isMain;
  final Value<bool> isToUpdate;
  final Value<bool> isToDelete;
  final Value<bool> isAddedToBackend;
  const WorkoutPlansCompanion({
    this.id = const Value.absent(),
    this.backendId = const Value.absent(),
    this.userId = const Value.absent(),
    this.isPublic = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.isMain = const Value.absent(),
    this.isToUpdate = const Value.absent(),
    this.isToDelete = const Value.absent(),
    this.isAddedToBackend = const Value.absent(),
  });
  WorkoutPlansCompanion.insert({
    this.id = const Value.absent(),
    this.backendId = const Value.absent(),
    required int userId,
    this.isPublic = const Value.absent(),
    this.name = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.isMain = const Value.absent(),
    this.isToUpdate = const Value.absent(),
    this.isToDelete = const Value.absent(),
    this.isAddedToBackend = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<WorkoutPlan> custom({
    Expression<int>? id,
    Expression<int>? backendId,
    Expression<int>? userId,
    Expression<bool>? isPublic,
    Expression<String>? name,
    Expression<String>? imagePath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<bool>? isMain,
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
      if (imagePath != null) 'image_path': imagePath,
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (isMain != null) 'is_main': isMain,
      if (isToUpdate != null) 'is_to_update': isToUpdate,
      if (isToDelete != null) 'is_to_delete': isToDelete,
      if (isAddedToBackend != null) 'is_added_to_backend': isAddedToBackend,
    });
  }

  WorkoutPlansCompanion copyWith({
    Value<int>? id,
    Value<int?>? backendId,
    Value<int>? userId,
    Value<bool>? isPublic,
    Value<String>? name,
    Value<String>? imagePath,
    Value<DateTime>? createdAt,
    Value<DateTime>? lastUpdatedAt,
    Value<bool>? isMain,
    Value<bool>? isToUpdate,
    Value<bool>? isToDelete,
    Value<bool>? isAddedToBackend,
  }) {
    return WorkoutPlansCompanion(
      id: id ?? this.id,
      backendId: backendId ?? this.backendId,
      userId: userId ?? this.userId,
      isPublic: isPublic ?? this.isPublic,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      isMain: isMain ?? this.isMain,
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
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (isMain.present) {
      map['is_main'] = Variable<bool>(isMain.value);
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
    return (StringBuffer('WorkoutPlansCompanion(')
          ..write('id: $id, ')
          ..write('backendId: $backendId, ')
          ..write('userId: $userId, ')
          ..write('isPublic: $isPublic, ')
          ..write('name: $name, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('isMain: $isMain, ')
          ..write('isToUpdate: $isToUpdate, ')
          ..write('isToDelete: $isToDelete, ')
          ..write('isAddedToBackend: $isAddedToBackend')
          ..write(')'))
        .toString();
  }
}

class $WorkoutDaysTable extends WorkoutDays
    with TableInfo<$WorkoutDaysTable, WorkoutDay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutDaysTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _workoutPlanIdMeta = const VerificationMeta(
    'workoutPlanId',
  );
  @override
  late final GeneratedColumn<int> workoutPlanId = GeneratedColumn<int>(
    'workout_plan_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workout_plans (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _workoutDayOfWeekMeta = const VerificationMeta(
    'workoutDayOfWeek',
  );
  @override
  late final GeneratedColumn<int> workoutDayOfWeek = GeneratedColumn<int>(
    'workout_day_of_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [id, workoutPlanId, workoutDayOfWeek];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_days';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutDay> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('workout_plan_id')) {
      context.handle(
        _workoutPlanIdMeta,
        workoutPlanId.isAcceptableOrUnknown(
          data['workout_plan_id']!,
          _workoutPlanIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workoutPlanIdMeta);
    }
    if (data.containsKey('workout_day_of_week')) {
      context.handle(
        _workoutDayOfWeekMeta,
        workoutDayOfWeek.isAcceptableOrUnknown(
          data['workout_day_of_week']!,
          _workoutDayOfWeekMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutDay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutDay(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      workoutPlanId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}workout_plan_id'],
      )!,
      workoutDayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}workout_day_of_week'],
      )!,
    );
  }

  @override
  $WorkoutDaysTable createAlias(String alias) {
    return $WorkoutDaysTable(attachedDatabase, alias);
  }
}

class WorkoutDay extends DataClass implements Insertable<WorkoutDay> {
  final int id;
  final int workoutPlanId;
  final int workoutDayOfWeek;
  const WorkoutDay({
    required this.id,
    required this.workoutPlanId,
    required this.workoutDayOfWeek,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['workout_plan_id'] = Variable<int>(workoutPlanId);
    map['workout_day_of_week'] = Variable<int>(workoutDayOfWeek);
    return map;
  }

  WorkoutDaysCompanion toCompanion(bool nullToAbsent) {
    return WorkoutDaysCompanion(
      id: Value(id),
      workoutPlanId: Value(workoutPlanId),
      workoutDayOfWeek: Value(workoutDayOfWeek),
    );
  }

  factory WorkoutDay.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutDay(
      id: serializer.fromJson<int>(json['id']),
      workoutPlanId: serializer.fromJson<int>(json['workoutPlanId']),
      workoutDayOfWeek: serializer.fromJson<int>(json['workoutDayOfWeek']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workoutPlanId': serializer.toJson<int>(workoutPlanId),
      'workoutDayOfWeek': serializer.toJson<int>(workoutDayOfWeek),
    };
  }

  WorkoutDay copyWith({int? id, int? workoutPlanId, int? workoutDayOfWeek}) =>
      WorkoutDay(
        id: id ?? this.id,
        workoutPlanId: workoutPlanId ?? this.workoutPlanId,
        workoutDayOfWeek: workoutDayOfWeek ?? this.workoutDayOfWeek,
      );
  WorkoutDay copyWithCompanion(WorkoutDaysCompanion data) {
    return WorkoutDay(
      id: data.id.present ? data.id.value : this.id,
      workoutPlanId: data.workoutPlanId.present
          ? data.workoutPlanId.value
          : this.workoutPlanId,
      workoutDayOfWeek: data.workoutDayOfWeek.present
          ? data.workoutDayOfWeek.value
          : this.workoutDayOfWeek,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutDay(')
          ..write('id: $id, ')
          ..write('workoutPlanId: $workoutPlanId, ')
          ..write('workoutDayOfWeek: $workoutDayOfWeek')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, workoutPlanId, workoutDayOfWeek);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutDay &&
          other.id == this.id &&
          other.workoutPlanId == this.workoutPlanId &&
          other.workoutDayOfWeek == this.workoutDayOfWeek);
}

class WorkoutDaysCompanion extends UpdateCompanion<WorkoutDay> {
  final Value<int> id;
  final Value<int> workoutPlanId;
  final Value<int> workoutDayOfWeek;
  const WorkoutDaysCompanion({
    this.id = const Value.absent(),
    this.workoutPlanId = const Value.absent(),
    this.workoutDayOfWeek = const Value.absent(),
  });
  WorkoutDaysCompanion.insert({
    this.id = const Value.absent(),
    required int workoutPlanId,
    this.workoutDayOfWeek = const Value.absent(),
  }) : workoutPlanId = Value(workoutPlanId);
  static Insertable<WorkoutDay> custom({
    Expression<int>? id,
    Expression<int>? workoutPlanId,
    Expression<int>? workoutDayOfWeek,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutPlanId != null) 'workout_plan_id': workoutPlanId,
      if (workoutDayOfWeek != null) 'workout_day_of_week': workoutDayOfWeek,
    });
  }

  WorkoutDaysCompanion copyWith({
    Value<int>? id,
    Value<int>? workoutPlanId,
    Value<int>? workoutDayOfWeek,
  }) {
    return WorkoutDaysCompanion(
      id: id ?? this.id,
      workoutPlanId: workoutPlanId ?? this.workoutPlanId,
      workoutDayOfWeek: workoutDayOfWeek ?? this.workoutDayOfWeek,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workoutPlanId.present) {
      map['workout_plan_id'] = Variable<int>(workoutPlanId.value);
    }
    if (workoutDayOfWeek.present) {
      map['workout_day_of_week'] = Variable<int>(workoutDayOfWeek.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutDaysCompanion(')
          ..write('id: $id, ')
          ..write('workoutPlanId: $workoutPlanId, ')
          ..write('workoutDayOfWeek: $workoutDayOfWeek')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSessionsTable extends WorkoutSessions
    with TableInfo<$WorkoutSessionsTable, WorkoutSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSessionsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _workoutDayIdMeta = const VerificationMeta(
    'workoutDayId',
  );
  @override
  late final GeneratedColumn<int> workoutDayId = GeneratedColumn<int>(
    'workout_day_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workout_days (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Default'),
  );
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<String> start = GeneratedColumn<String>(
    'start',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('00:00'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workoutDayId,
    name,
    location,
    start,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('workout_day_id')) {
      context.handle(
        _workoutDayIdMeta,
        workoutDayId.isAcceptableOrUnknown(
          data['workout_day_id']!,
          _workoutDayIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workoutDayIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('start')) {
      context.handle(
        _startMeta,
        start.isAcceptableOrUnknown(data['start']!, _startMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      workoutDayId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}workout_day_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      start: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start'],
      )!,
    );
  }

  @override
  $WorkoutSessionsTable createAlias(String alias) {
    return $WorkoutSessionsTable(attachedDatabase, alias);
  }
}

class WorkoutSession extends DataClass implements Insertable<WorkoutSession> {
  final int id;
  final int workoutDayId;
  final String name;
  final String location;
  final String start;
  const WorkoutSession({
    required this.id,
    required this.workoutDayId,
    required this.name,
    required this.location,
    required this.start,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['workout_day_id'] = Variable<int>(workoutDayId);
    map['name'] = Variable<String>(name);
    map['location'] = Variable<String>(location);
    map['start'] = Variable<String>(start);
    return map;
  }

  WorkoutSessionsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSessionsCompanion(
      id: Value(id),
      workoutDayId: Value(workoutDayId),
      name: Value(name),
      location: Value(location),
      start: Value(start),
    );
  }

  factory WorkoutSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSession(
      id: serializer.fromJson<int>(json['id']),
      workoutDayId: serializer.fromJson<int>(json['workoutDayId']),
      name: serializer.fromJson<String>(json['name']),
      location: serializer.fromJson<String>(json['location']),
      start: serializer.fromJson<String>(json['start']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workoutDayId': serializer.toJson<int>(workoutDayId),
      'name': serializer.toJson<String>(name),
      'location': serializer.toJson<String>(location),
      'start': serializer.toJson<String>(start),
    };
  }

  WorkoutSession copyWith({
    int? id,
    int? workoutDayId,
    String? name,
    String? location,
    String? start,
  }) => WorkoutSession(
    id: id ?? this.id,
    workoutDayId: workoutDayId ?? this.workoutDayId,
    name: name ?? this.name,
    location: location ?? this.location,
    start: start ?? this.start,
  );
  WorkoutSession copyWithCompanion(WorkoutSessionsCompanion data) {
    return WorkoutSession(
      id: data.id.present ? data.id.value : this.id,
      workoutDayId: data.workoutDayId.present
          ? data.workoutDayId.value
          : this.workoutDayId,
      name: data.name.present ? data.name.value : this.name,
      location: data.location.present ? data.location.value : this.location,
      start: data.start.present ? data.start.value : this.start,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSession(')
          ..write('id: $id, ')
          ..write('workoutDayId: $workoutDayId, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('start: $start')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, workoutDayId, name, location, start);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSession &&
          other.id == this.id &&
          other.workoutDayId == this.workoutDayId &&
          other.name == this.name &&
          other.location == this.location &&
          other.start == this.start);
}

class WorkoutSessionsCompanion extends UpdateCompanion<WorkoutSession> {
  final Value<int> id;
  final Value<int> workoutDayId;
  final Value<String> name;
  final Value<String> location;
  final Value<String> start;
  const WorkoutSessionsCompanion({
    this.id = const Value.absent(),
    this.workoutDayId = const Value.absent(),
    this.name = const Value.absent(),
    this.location = const Value.absent(),
    this.start = const Value.absent(),
  });
  WorkoutSessionsCompanion.insert({
    this.id = const Value.absent(),
    required int workoutDayId,
    this.name = const Value.absent(),
    this.location = const Value.absent(),
    this.start = const Value.absent(),
  }) : workoutDayId = Value(workoutDayId);
  static Insertable<WorkoutSession> custom({
    Expression<int>? id,
    Expression<int>? workoutDayId,
    Expression<String>? name,
    Expression<String>? location,
    Expression<String>? start,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutDayId != null) 'workout_day_id': workoutDayId,
      if (name != null) 'name': name,
      if (location != null) 'location': location,
      if (start != null) 'start': start,
    });
  }

  WorkoutSessionsCompanion copyWith({
    Value<int>? id,
    Value<int>? workoutDayId,
    Value<String>? name,
    Value<String>? location,
    Value<String>? start,
  }) {
    return WorkoutSessionsCompanion(
      id: id ?? this.id,
      workoutDayId: workoutDayId ?? this.workoutDayId,
      name: name ?? this.name,
      location: location ?? this.location,
      start: start ?? this.start,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workoutDayId.present) {
      map['workout_day_id'] = Variable<int>(workoutDayId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (start.present) {
      map['start'] = Variable<String>(start.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionsCompanion(')
          ..write('id: $id, ')
          ..write('workoutDayId: $workoutDayId, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('start: $start')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _workoutSessionIdMeta = const VerificationMeta(
    'workoutSessionId',
  );
  @override
  late final GeneratedColumn<int> workoutSessionId = GeneratedColumn<int>(
    'workout_session_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES workout_sessions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<double> time = GeneratedColumn<double>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _breakTimeMeta = const VerificationMeta(
    'breakTime',
  );
  @override
  late final GeneratedColumn<double> breakTime = GeneratedColumn<double>(
    'break_time',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _setNumberMeta = const VerificationMeta(
    'setNumber',
  );
  @override
  late final GeneratedColumn<int> setNumber = GeneratedColumn<int>(
    'set_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _repNumberMeta = const VerificationMeta(
    'repNumber',
  );
  @override
  late final GeneratedColumn<int> repNumber = GeneratedColumn<int>(
    'rep_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    workoutSessionId,
    name,
    time,
    breakTime,
    setNumber,
    repNumber,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<Exercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('workout_session_id')) {
      context.handle(
        _workoutSessionIdMeta,
        workoutSessionId.isAcceptableOrUnknown(
          data['workout_session_id']!,
          _workoutSessionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workoutSessionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    }
    if (data.containsKey('break_time')) {
      context.handle(
        _breakTimeMeta,
        breakTime.isAcceptableOrUnknown(data['break_time']!, _breakTimeMeta),
      );
    }
    if (data.containsKey('set_number')) {
      context.handle(
        _setNumberMeta,
        setNumber.isAcceptableOrUnknown(data['set_number']!, _setNumberMeta),
      );
    }
    if (data.containsKey('rep_number')) {
      context.handle(
        _repNumberMeta,
        repNumber.isAcceptableOrUnknown(data['rep_number']!, _repNumberMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      workoutSessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}workout_session_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}time'],
      )!,
      breakTime: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}break_time'],
      )!,
      setNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}set_number'],
      )!,
      repNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rep_number'],
      )!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final int id;
  final int workoutSessionId;
  final String name;
  final double time;
  final double breakTime;
  final int setNumber;
  final int repNumber;
  const Exercise({
    required this.id,
    required this.workoutSessionId,
    required this.name,
    required this.time,
    required this.breakTime,
    required this.setNumber,
    required this.repNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['workout_session_id'] = Variable<int>(workoutSessionId);
    map['name'] = Variable<String>(name);
    map['time'] = Variable<double>(time);
    map['break_time'] = Variable<double>(breakTime);
    map['set_number'] = Variable<int>(setNumber);
    map['rep_number'] = Variable<int>(repNumber);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      workoutSessionId: Value(workoutSessionId),
      name: Value(name),
      time: Value(time),
      breakTime: Value(breakTime),
      setNumber: Value(setNumber),
      repNumber: Value(repNumber),
    );
  }

  factory Exercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<int>(json['id']),
      workoutSessionId: serializer.fromJson<int>(json['workoutSessionId']),
      name: serializer.fromJson<String>(json['name']),
      time: serializer.fromJson<double>(json['time']),
      breakTime: serializer.fromJson<double>(json['breakTime']),
      setNumber: serializer.fromJson<int>(json['setNumber']),
      repNumber: serializer.fromJson<int>(json['repNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workoutSessionId': serializer.toJson<int>(workoutSessionId),
      'name': serializer.toJson<String>(name),
      'time': serializer.toJson<double>(time),
      'breakTime': serializer.toJson<double>(breakTime),
      'setNumber': serializer.toJson<int>(setNumber),
      'repNumber': serializer.toJson<int>(repNumber),
    };
  }

  Exercise copyWith({
    int? id,
    int? workoutSessionId,
    String? name,
    double? time,
    double? breakTime,
    int? setNumber,
    int? repNumber,
  }) => Exercise(
    id: id ?? this.id,
    workoutSessionId: workoutSessionId ?? this.workoutSessionId,
    name: name ?? this.name,
    time: time ?? this.time,
    breakTime: breakTime ?? this.breakTime,
    setNumber: setNumber ?? this.setNumber,
    repNumber: repNumber ?? this.repNumber,
  );
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      id: data.id.present ? data.id.value : this.id,
      workoutSessionId: data.workoutSessionId.present
          ? data.workoutSessionId.value
          : this.workoutSessionId,
      name: data.name.present ? data.name.value : this.name,
      time: data.time.present ? data.time.value : this.time,
      breakTime: data.breakTime.present ? data.breakTime.value : this.breakTime,
      setNumber: data.setNumber.present ? data.setNumber.value : this.setNumber,
      repNumber: data.repNumber.present ? data.repNumber.value : this.repNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('workoutSessionId: $workoutSessionId, ')
          ..write('name: $name, ')
          ..write('time: $time, ')
          ..write('breakTime: $breakTime, ')
          ..write('setNumber: $setNumber, ')
          ..write('repNumber: $repNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    workoutSessionId,
    name,
    time,
    breakTime,
    setNumber,
    repNumber,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise &&
          other.id == this.id &&
          other.workoutSessionId == this.workoutSessionId &&
          other.name == this.name &&
          other.time == this.time &&
          other.breakTime == this.breakTime &&
          other.setNumber == this.setNumber &&
          other.repNumber == this.repNumber);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<int> id;
  final Value<int> workoutSessionId;
  final Value<String> name;
  final Value<double> time;
  final Value<double> breakTime;
  final Value<int> setNumber;
  final Value<int> repNumber;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.workoutSessionId = const Value.absent(),
    this.name = const Value.absent(),
    this.time = const Value.absent(),
    this.breakTime = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.repNumber = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    required int workoutSessionId,
    this.name = const Value.absent(),
    this.time = const Value.absent(),
    this.breakTime = const Value.absent(),
    this.setNumber = const Value.absent(),
    this.repNumber = const Value.absent(),
  }) : workoutSessionId = Value(workoutSessionId);
  static Insertable<Exercise> custom({
    Expression<int>? id,
    Expression<int>? workoutSessionId,
    Expression<String>? name,
    Expression<double>? time,
    Expression<double>? breakTime,
    Expression<int>? setNumber,
    Expression<int>? repNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutSessionId != null) 'workout_session_id': workoutSessionId,
      if (name != null) 'name': name,
      if (time != null) 'time': time,
      if (breakTime != null) 'break_time': breakTime,
      if (setNumber != null) 'set_number': setNumber,
      if (repNumber != null) 'rep_number': repNumber,
    });
  }

  ExercisesCompanion copyWith({
    Value<int>? id,
    Value<int>? workoutSessionId,
    Value<String>? name,
    Value<double>? time,
    Value<double>? breakTime,
    Value<int>? setNumber,
    Value<int>? repNumber,
  }) {
    return ExercisesCompanion(
      id: id ?? this.id,
      workoutSessionId: workoutSessionId ?? this.workoutSessionId,
      name: name ?? this.name,
      time: time ?? this.time,
      breakTime: breakTime ?? this.breakTime,
      setNumber: setNumber ?? this.setNumber,
      repNumber: repNumber ?? this.repNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workoutSessionId.present) {
      map['workout_session_id'] = Variable<int>(workoutSessionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (time.present) {
      map['time'] = Variable<double>(time.value);
    }
    if (breakTime.present) {
      map['break_time'] = Variable<double>(breakTime.value);
    }
    if (setNumber.present) {
      map['set_number'] = Variable<int>(setNumber.value);
    }
    if (repNumber.present) {
      map['rep_number'] = Variable<int>(repNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('workoutSessionId: $workoutSessionId, ')
          ..write('name: $name, ')
          ..write('time: $time, ')
          ..write('breakTime: $breakTime, ')
          ..write('setNumber: $setNumber, ')
          ..write('repNumber: $repNumber')
          ..write(')'))
        .toString();
  }
}

class $BenchmarksTable extends Benchmarks
    with TableInfo<$BenchmarksTable, Benchmark> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BenchmarksTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _bodyWeightMeta = const VerificationMeta(
    'bodyWeight',
  );
  @override
  late final GeneratedColumn<double> bodyWeight = GeneratedColumn<double>(
    'body_weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ex1PointsMeta = const VerificationMeta(
    'ex1Points',
  );
  @override
  late final GeneratedColumn<int> ex1Points = GeneratedColumn<int>(
    'ex1_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ex2PointsMeta = const VerificationMeta(
    'ex2Points',
  );
  @override
  late final GeneratedColumn<int> ex2Points = GeneratedColumn<int>(
    'ex2_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ex3PointsMeta = const VerificationMeta(
    'ex3Points',
  );
  @override
  late final GeneratedColumn<int> ex3Points = GeneratedColumn<int>(
    'ex3_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ex4PointsMeta = const VerificationMeta(
    'ex4Points',
  );
  @override
  late final GeneratedColumn<int> ex4Points = GeneratedColumn<int>(
    'ex4_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    backendId,
    userId,
    bodyWeight,
    ex1Points,
    ex2Points,
    ex3Points,
    ex4Points,
    isToDelete,
    isAddedToBackend,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'benchmarks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Benchmark> instance, {
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
    if (data.containsKey('body_weight')) {
      context.handle(
        _bodyWeightMeta,
        bodyWeight.isAcceptableOrUnknown(data['body_weight']!, _bodyWeightMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyWeightMeta);
    }
    if (data.containsKey('ex1_points')) {
      context.handle(
        _ex1PointsMeta,
        ex1Points.isAcceptableOrUnknown(data['ex1_points']!, _ex1PointsMeta),
      );
    } else if (isInserting) {
      context.missing(_ex1PointsMeta);
    }
    if (data.containsKey('ex2_points')) {
      context.handle(
        _ex2PointsMeta,
        ex2Points.isAcceptableOrUnknown(data['ex2_points']!, _ex2PointsMeta),
      );
    } else if (isInserting) {
      context.missing(_ex2PointsMeta);
    }
    if (data.containsKey('ex3_points')) {
      context.handle(
        _ex3PointsMeta,
        ex3Points.isAcceptableOrUnknown(data['ex3_points']!, _ex3PointsMeta),
      );
    } else if (isInserting) {
      context.missing(_ex3PointsMeta);
    }
    if (data.containsKey('ex4_points')) {
      context.handle(
        _ex4PointsMeta,
        ex4Points.isAcceptableOrUnknown(data['ex4_points']!, _ex4PointsMeta),
      );
    } else if (isInserting) {
      context.missing(_ex4PointsMeta);
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Benchmark map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Benchmark(
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
      bodyWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}body_weight'],
      )!,
      ex1Points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ex1_points'],
      )!,
      ex2Points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ex2_points'],
      )!,
      ex3Points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ex3_points'],
      )!,
      ex4Points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ex4_points'],
      )!,
      isToDelete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_to_delete'],
      )!,
      isAddedToBackend: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_added_to_backend'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BenchmarksTable createAlias(String alias) {
    return $BenchmarksTable(attachedDatabase, alias);
  }
}

class Benchmark extends DataClass implements Insertable<Benchmark> {
  final int id;
  final int backendId;
  final int userId;
  final double bodyWeight;
  final int ex1Points;
  final int ex2Points;
  final int ex3Points;
  final int ex4Points;
  final bool isToDelete;
  final bool isAddedToBackend;
  final DateTime createdAt;
  const Benchmark({
    required this.id,
    required this.backendId,
    required this.userId,
    required this.bodyWeight,
    required this.ex1Points,
    required this.ex2Points,
    required this.ex3Points,
    required this.ex4Points,
    required this.isToDelete,
    required this.isAddedToBackend,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['backend_id'] = Variable<int>(backendId);
    map['user_id'] = Variable<int>(userId);
    map['body_weight'] = Variable<double>(bodyWeight);
    map['ex1_points'] = Variable<int>(ex1Points);
    map['ex2_points'] = Variable<int>(ex2Points);
    map['ex3_points'] = Variable<int>(ex3Points);
    map['ex4_points'] = Variable<int>(ex4Points);
    map['is_to_delete'] = Variable<bool>(isToDelete);
    map['is_added_to_backend'] = Variable<bool>(isAddedToBackend);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BenchmarksCompanion toCompanion(bool nullToAbsent) {
    return BenchmarksCompanion(
      id: Value(id),
      backendId: Value(backendId),
      userId: Value(userId),
      bodyWeight: Value(bodyWeight),
      ex1Points: Value(ex1Points),
      ex2Points: Value(ex2Points),
      ex3Points: Value(ex3Points),
      ex4Points: Value(ex4Points),
      isToDelete: Value(isToDelete),
      isAddedToBackend: Value(isAddedToBackend),
      createdAt: Value(createdAt),
    );
  }

  factory Benchmark.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Benchmark(
      id: serializer.fromJson<int>(json['id']),
      backendId: serializer.fromJson<int>(json['backendId']),
      userId: serializer.fromJson<int>(json['userId']),
      bodyWeight: serializer.fromJson<double>(json['bodyWeight']),
      ex1Points: serializer.fromJson<int>(json['ex1Points']),
      ex2Points: serializer.fromJson<int>(json['ex2Points']),
      ex3Points: serializer.fromJson<int>(json['ex3Points']),
      ex4Points: serializer.fromJson<int>(json['ex4Points']),
      isToDelete: serializer.fromJson<bool>(json['isToDelete']),
      isAddedToBackend: serializer.fromJson<bool>(json['isAddedToBackend']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'backendId': serializer.toJson<int>(backendId),
      'userId': serializer.toJson<int>(userId),
      'bodyWeight': serializer.toJson<double>(bodyWeight),
      'ex1Points': serializer.toJson<int>(ex1Points),
      'ex2Points': serializer.toJson<int>(ex2Points),
      'ex3Points': serializer.toJson<int>(ex3Points),
      'ex4Points': serializer.toJson<int>(ex4Points),
      'isToDelete': serializer.toJson<bool>(isToDelete),
      'isAddedToBackend': serializer.toJson<bool>(isAddedToBackend),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Benchmark copyWith({
    int? id,
    int? backendId,
    int? userId,
    double? bodyWeight,
    int? ex1Points,
    int? ex2Points,
    int? ex3Points,
    int? ex4Points,
    bool? isToDelete,
    bool? isAddedToBackend,
    DateTime? createdAt,
  }) => Benchmark(
    id: id ?? this.id,
    backendId: backendId ?? this.backendId,
    userId: userId ?? this.userId,
    bodyWeight: bodyWeight ?? this.bodyWeight,
    ex1Points: ex1Points ?? this.ex1Points,
    ex2Points: ex2Points ?? this.ex2Points,
    ex3Points: ex3Points ?? this.ex3Points,
    ex4Points: ex4Points ?? this.ex4Points,
    isToDelete: isToDelete ?? this.isToDelete,
    isAddedToBackend: isAddedToBackend ?? this.isAddedToBackend,
    createdAt: createdAt ?? this.createdAt,
  );
  Benchmark copyWithCompanion(BenchmarksCompanion data) {
    return Benchmark(
      id: data.id.present ? data.id.value : this.id,
      backendId: data.backendId.present ? data.backendId.value : this.backendId,
      userId: data.userId.present ? data.userId.value : this.userId,
      bodyWeight: data.bodyWeight.present
          ? data.bodyWeight.value
          : this.bodyWeight,
      ex1Points: data.ex1Points.present ? data.ex1Points.value : this.ex1Points,
      ex2Points: data.ex2Points.present ? data.ex2Points.value : this.ex2Points,
      ex3Points: data.ex3Points.present ? data.ex3Points.value : this.ex3Points,
      ex4Points: data.ex4Points.present ? data.ex4Points.value : this.ex4Points,
      isToDelete: data.isToDelete.present
          ? data.isToDelete.value
          : this.isToDelete,
      isAddedToBackend: data.isAddedToBackend.present
          ? data.isAddedToBackend.value
          : this.isAddedToBackend,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Benchmark(')
          ..write('id: $id, ')
          ..write('backendId: $backendId, ')
          ..write('userId: $userId, ')
          ..write('bodyWeight: $bodyWeight, ')
          ..write('ex1Points: $ex1Points, ')
          ..write('ex2Points: $ex2Points, ')
          ..write('ex3Points: $ex3Points, ')
          ..write('ex4Points: $ex4Points, ')
          ..write('isToDelete: $isToDelete, ')
          ..write('isAddedToBackend: $isAddedToBackend, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    backendId,
    userId,
    bodyWeight,
    ex1Points,
    ex2Points,
    ex3Points,
    ex4Points,
    isToDelete,
    isAddedToBackend,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Benchmark &&
          other.id == this.id &&
          other.backendId == this.backendId &&
          other.userId == this.userId &&
          other.bodyWeight == this.bodyWeight &&
          other.ex1Points == this.ex1Points &&
          other.ex2Points == this.ex2Points &&
          other.ex3Points == this.ex3Points &&
          other.ex4Points == this.ex4Points &&
          other.isToDelete == this.isToDelete &&
          other.isAddedToBackend == this.isAddedToBackend &&
          other.createdAt == this.createdAt);
}

class BenchmarksCompanion extends UpdateCompanion<Benchmark> {
  final Value<int> id;
  final Value<int> backendId;
  final Value<int> userId;
  final Value<double> bodyWeight;
  final Value<int> ex1Points;
  final Value<int> ex2Points;
  final Value<int> ex3Points;
  final Value<int> ex4Points;
  final Value<bool> isToDelete;
  final Value<bool> isAddedToBackend;
  final Value<DateTime> createdAt;
  const BenchmarksCompanion({
    this.id = const Value.absent(),
    this.backendId = const Value.absent(),
    this.userId = const Value.absent(),
    this.bodyWeight = const Value.absent(),
    this.ex1Points = const Value.absent(),
    this.ex2Points = const Value.absent(),
    this.ex3Points = const Value.absent(),
    this.ex4Points = const Value.absent(),
    this.isToDelete = const Value.absent(),
    this.isAddedToBackend = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BenchmarksCompanion.insert({
    this.id = const Value.absent(),
    required int backendId,
    required int userId,
    required double bodyWeight,
    required int ex1Points,
    required int ex2Points,
    required int ex3Points,
    required int ex4Points,
    this.isToDelete = const Value.absent(),
    this.isAddedToBackend = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : backendId = Value(backendId),
       userId = Value(userId),
       bodyWeight = Value(bodyWeight),
       ex1Points = Value(ex1Points),
       ex2Points = Value(ex2Points),
       ex3Points = Value(ex3Points),
       ex4Points = Value(ex4Points);
  static Insertable<Benchmark> custom({
    Expression<int>? id,
    Expression<int>? backendId,
    Expression<int>? userId,
    Expression<double>? bodyWeight,
    Expression<int>? ex1Points,
    Expression<int>? ex2Points,
    Expression<int>? ex3Points,
    Expression<int>? ex4Points,
    Expression<bool>? isToDelete,
    Expression<bool>? isAddedToBackend,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (backendId != null) 'backend_id': backendId,
      if (userId != null) 'user_id': userId,
      if (bodyWeight != null) 'body_weight': bodyWeight,
      if (ex1Points != null) 'ex1_points': ex1Points,
      if (ex2Points != null) 'ex2_points': ex2Points,
      if (ex3Points != null) 'ex3_points': ex3Points,
      if (ex4Points != null) 'ex4_points': ex4Points,
      if (isToDelete != null) 'is_to_delete': isToDelete,
      if (isAddedToBackend != null) 'is_added_to_backend': isAddedToBackend,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BenchmarksCompanion copyWith({
    Value<int>? id,
    Value<int>? backendId,
    Value<int>? userId,
    Value<double>? bodyWeight,
    Value<int>? ex1Points,
    Value<int>? ex2Points,
    Value<int>? ex3Points,
    Value<int>? ex4Points,
    Value<bool>? isToDelete,
    Value<bool>? isAddedToBackend,
    Value<DateTime>? createdAt,
  }) {
    return BenchmarksCompanion(
      id: id ?? this.id,
      backendId: backendId ?? this.backendId,
      userId: userId ?? this.userId,
      bodyWeight: bodyWeight ?? this.bodyWeight,
      ex1Points: ex1Points ?? this.ex1Points,
      ex2Points: ex2Points ?? this.ex2Points,
      ex3Points: ex3Points ?? this.ex3Points,
      ex4Points: ex4Points ?? this.ex4Points,
      isToDelete: isToDelete ?? this.isToDelete,
      isAddedToBackend: isAddedToBackend ?? this.isAddedToBackend,
      createdAt: createdAt ?? this.createdAt,
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
    if (bodyWeight.present) {
      map['body_weight'] = Variable<double>(bodyWeight.value);
    }
    if (ex1Points.present) {
      map['ex1_points'] = Variable<int>(ex1Points.value);
    }
    if (ex2Points.present) {
      map['ex2_points'] = Variable<int>(ex2Points.value);
    }
    if (ex3Points.present) {
      map['ex3_points'] = Variable<int>(ex3Points.value);
    }
    if (ex4Points.present) {
      map['ex4_points'] = Variable<int>(ex4Points.value);
    }
    if (isToDelete.present) {
      map['is_to_delete'] = Variable<bool>(isToDelete.value);
    }
    if (isAddedToBackend.present) {
      map['is_added_to_backend'] = Variable<bool>(isAddedToBackend.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BenchmarksCompanion(')
          ..write('id: $id, ')
          ..write('backendId: $backendId, ')
          ..write('userId: $userId, ')
          ..write('bodyWeight: $bodyWeight, ')
          ..write('ex1Points: $ex1Points, ')
          ..write('ex2Points: $ex2Points, ')
          ..write('ex3Points: $ex3Points, ')
          ..write('ex4Points: $ex4Points, ')
          ..write('isToDelete: $isToDelete, ')
          ..write('isAddedToBackend: $isAddedToBackend, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ClimbingRoutesTable climbingRoutes = $ClimbingRoutesTable(this);
  late final $WorkoutPlansTable workoutPlans = $WorkoutPlansTable(this);
  late final $WorkoutDaysTable workoutDays = $WorkoutDaysTable(this);
  late final $WorkoutSessionsTable workoutSessions = $WorkoutSessionsTable(
    this,
  );
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $BenchmarksTable benchmarks = $BenchmarksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    climbingRoutes,
    workoutPlans,
    workoutDays,
    workoutSessions,
    exercises,
    benchmarks,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'workout_plans',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('workout_days', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'workout_days',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('workout_sessions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'workout_sessions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('exercises', kind: UpdateKind.delete)],
    ),
  ]);
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
      Value<bool> isImagePendingUpdate,
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
      Value<bool> isImagePendingUpdate,
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

  ColumnFilters<bool> get isImagePendingUpdate => $composableBuilder(
    column: $table.isImagePendingUpdate,
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

  ColumnOrderings<bool> get isImagePendingUpdate => $composableBuilder(
    column: $table.isImagePendingUpdate,
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

  GeneratedColumn<bool> get isImagePendingUpdate => $composableBuilder(
    column: $table.isImagePendingUpdate,
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
                Value<bool> isImagePendingUpdate = const Value.absent(),
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
                isImagePendingUpdate: isImagePendingUpdate,
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
                Value<bool> isImagePendingUpdate = const Value.absent(),
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
                isImagePendingUpdate: isImagePendingUpdate,
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
typedef $$WorkoutPlansTableCreateCompanionBuilder =
    WorkoutPlansCompanion Function({
      Value<int> id,
      Value<int?> backendId,
      required int userId,
      Value<bool> isPublic,
      Value<String> name,
      Value<String> imagePath,
      Value<DateTime> createdAt,
      Value<DateTime> lastUpdatedAt,
      Value<bool> isMain,
      Value<bool> isToUpdate,
      Value<bool> isToDelete,
      Value<bool> isAddedToBackend,
    });
typedef $$WorkoutPlansTableUpdateCompanionBuilder =
    WorkoutPlansCompanion Function({
      Value<int> id,
      Value<int?> backendId,
      Value<int> userId,
      Value<bool> isPublic,
      Value<String> name,
      Value<String> imagePath,
      Value<DateTime> createdAt,
      Value<DateTime> lastUpdatedAt,
      Value<bool> isMain,
      Value<bool> isToUpdate,
      Value<bool> isToDelete,
      Value<bool> isAddedToBackend,
    });

final class $$WorkoutPlansTableReferences
    extends BaseReferences<_$AppDatabase, $WorkoutPlansTable, WorkoutPlan> {
  $$WorkoutPlansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WorkoutDaysTable, List<WorkoutDay>>
  _workoutDaysRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutDays,
    aliasName: $_aliasNameGenerator(
      db.workoutPlans.id,
      db.workoutDays.workoutPlanId,
    ),
  );

  $$WorkoutDaysTableProcessedTableManager get workoutDaysRefs {
    final manager = $$WorkoutDaysTableTableManager(
      $_db,
      $_db.workoutDays,
    ).filter((f) => f.workoutPlanId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_workoutDaysRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutPlansTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableFilterComposer({
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

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
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

  ColumnFilters<bool> get isMain => $composableBuilder(
    column: $table.isMain,
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

  Expression<bool> workoutDaysRefs(
    Expression<bool> Function($$WorkoutDaysTableFilterComposer f) f,
  ) {
    final $$WorkoutDaysTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutDays,
      getReferencedColumn: (t) => t.workoutPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutDaysTableFilterComposer(
            $db: $db,
            $table: $db.workoutDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableOrderingComposer({
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

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
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

  ColumnOrderings<bool> get isMain => $composableBuilder(
    column: $table.isMain,
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

class $$WorkoutPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutPlansTable> {
  $$WorkoutPlansTableAnnotationComposer({
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

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isMain =>
      $composableBuilder(column: $table.isMain, builder: (column) => column);

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

  Expression<T> workoutDaysRefs<T extends Object>(
    Expression<T> Function($$WorkoutDaysTableAnnotationComposer a) f,
  ) {
    final $$WorkoutDaysTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutDays,
      getReferencedColumn: (t) => t.workoutPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutDaysTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutPlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutPlansTable,
          WorkoutPlan,
          $$WorkoutPlansTableFilterComposer,
          $$WorkoutPlansTableOrderingComposer,
          $$WorkoutPlansTableAnnotationComposer,
          $$WorkoutPlansTableCreateCompanionBuilder,
          $$WorkoutPlansTableUpdateCompanionBuilder,
          (WorkoutPlan, $$WorkoutPlansTableReferences),
          WorkoutPlan,
          PrefetchHooks Function({bool workoutDaysRefs})
        > {
  $$WorkoutPlansTableTableManager(_$AppDatabase db, $WorkoutPlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> backendId = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<bool> isPublic = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> lastUpdatedAt = const Value.absent(),
                Value<bool> isMain = const Value.absent(),
                Value<bool> isToUpdate = const Value.absent(),
                Value<bool> isToDelete = const Value.absent(),
                Value<bool> isAddedToBackend = const Value.absent(),
              }) => WorkoutPlansCompanion(
                id: id,
                backendId: backendId,
                userId: userId,
                isPublic: isPublic,
                name: name,
                imagePath: imagePath,
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                isMain: isMain,
                isToUpdate: isToUpdate,
                isToDelete: isToDelete,
                isAddedToBackend: isAddedToBackend,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> backendId = const Value.absent(),
                required int userId,
                Value<bool> isPublic = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> lastUpdatedAt = const Value.absent(),
                Value<bool> isMain = const Value.absent(),
                Value<bool> isToUpdate = const Value.absent(),
                Value<bool> isToDelete = const Value.absent(),
                Value<bool> isAddedToBackend = const Value.absent(),
              }) => WorkoutPlansCompanion.insert(
                id: id,
                backendId: backendId,
                userId: userId,
                isPublic: isPublic,
                name: name,
                imagePath: imagePath,
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                isMain: isMain,
                isToUpdate: isToUpdate,
                isToDelete: isToDelete,
                isAddedToBackend: isAddedToBackend,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkoutPlansTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workoutDaysRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (workoutDaysRefs) db.workoutDays],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (workoutDaysRefs)
                    await $_getPrefetchedData<
                      WorkoutPlan,
                      $WorkoutPlansTable,
                      WorkoutDay
                    >(
                      currentTable: table,
                      referencedTable: $$WorkoutPlansTableReferences
                          ._workoutDaysRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$WorkoutPlansTableReferences(
                            db,
                            table,
                            p0,
                          ).workoutDaysRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.workoutPlanId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$WorkoutPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutPlansTable,
      WorkoutPlan,
      $$WorkoutPlansTableFilterComposer,
      $$WorkoutPlansTableOrderingComposer,
      $$WorkoutPlansTableAnnotationComposer,
      $$WorkoutPlansTableCreateCompanionBuilder,
      $$WorkoutPlansTableUpdateCompanionBuilder,
      (WorkoutPlan, $$WorkoutPlansTableReferences),
      WorkoutPlan,
      PrefetchHooks Function({bool workoutDaysRefs})
    >;
typedef $$WorkoutDaysTableCreateCompanionBuilder =
    WorkoutDaysCompanion Function({
      Value<int> id,
      required int workoutPlanId,
      Value<int> workoutDayOfWeek,
    });
typedef $$WorkoutDaysTableUpdateCompanionBuilder =
    WorkoutDaysCompanion Function({
      Value<int> id,
      Value<int> workoutPlanId,
      Value<int> workoutDayOfWeek,
    });

final class $$WorkoutDaysTableReferences
    extends BaseReferences<_$AppDatabase, $WorkoutDaysTable, WorkoutDay> {
  $$WorkoutDaysTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutPlansTable _workoutPlanIdTable(_$AppDatabase db) =>
      db.workoutPlans.createAlias(
        $_aliasNameGenerator(db.workoutDays.workoutPlanId, db.workoutPlans.id),
      );

  $$WorkoutPlansTableProcessedTableManager get workoutPlanId {
    final $_column = $_itemColumn<int>('workout_plan_id')!;

    final manager = $$WorkoutPlansTableTableManager(
      $_db,
      $_db.workoutPlans,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workoutPlanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$WorkoutSessionsTable, List<WorkoutSession>>
  _workoutSessionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.workoutSessions,
    aliasName: $_aliasNameGenerator(
      db.workoutDays.id,
      db.workoutSessions.workoutDayId,
    ),
  );

  $$WorkoutSessionsTableProcessedTableManager get workoutSessionsRefs {
    final manager = $$WorkoutSessionsTableTableManager(
      $_db,
      $_db.workoutSessions,
    ).filter((f) => f.workoutDayId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _workoutSessionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutDaysTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutDaysTable> {
  $$WorkoutDaysTableFilterComposer({
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

  ColumnFilters<int> get workoutDayOfWeek => $composableBuilder(
    column: $table.workoutDayOfWeek,
    builder: (column) => ColumnFilters(column),
  );

  $$WorkoutPlansTableFilterComposer get workoutPlanId {
    final $$WorkoutPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutPlanId,
      referencedTable: $db.workoutPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutPlansTableFilterComposer(
            $db: $db,
            $table: $db.workoutPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> workoutSessionsRefs(
    Expression<bool> Function($$WorkoutSessionsTableFilterComposer f) f,
  ) {
    final $$WorkoutSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.workoutDayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableFilterComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutDaysTable> {
  $$WorkoutDaysTableOrderingComposer({
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

  ColumnOrderings<int> get workoutDayOfWeek => $composableBuilder(
    column: $table.workoutDayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorkoutPlansTableOrderingComposer get workoutPlanId {
    final $$WorkoutPlansTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutPlanId,
      referencedTable: $db.workoutPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutPlansTableOrderingComposer(
            $db: $db,
            $table: $db.workoutPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutDaysTable> {
  $$WorkoutDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get workoutDayOfWeek => $composableBuilder(
    column: $table.workoutDayOfWeek,
    builder: (column) => column,
  );

  $$WorkoutPlansTableAnnotationComposer get workoutPlanId {
    final $$WorkoutPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutPlanId,
      referencedTable: $db.workoutPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> workoutSessionsRefs<T extends Object>(
    Expression<T> Function($$WorkoutSessionsTableAnnotationComposer a) f,
  ) {
    final $$WorkoutSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.workoutDayId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutDaysTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutDaysTable,
          WorkoutDay,
          $$WorkoutDaysTableFilterComposer,
          $$WorkoutDaysTableOrderingComposer,
          $$WorkoutDaysTableAnnotationComposer,
          $$WorkoutDaysTableCreateCompanionBuilder,
          $$WorkoutDaysTableUpdateCompanionBuilder,
          (WorkoutDay, $$WorkoutDaysTableReferences),
          WorkoutDay,
          PrefetchHooks Function({bool workoutPlanId, bool workoutSessionsRefs})
        > {
  $$WorkoutDaysTableTableManager(_$AppDatabase db, $WorkoutDaysTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> workoutPlanId = const Value.absent(),
                Value<int> workoutDayOfWeek = const Value.absent(),
              }) => WorkoutDaysCompanion(
                id: id,
                workoutPlanId: workoutPlanId,
                workoutDayOfWeek: workoutDayOfWeek,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int workoutPlanId,
                Value<int> workoutDayOfWeek = const Value.absent(),
              }) => WorkoutDaysCompanion.insert(
                id: id,
                workoutPlanId: workoutPlanId,
                workoutDayOfWeek: workoutDayOfWeek,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkoutDaysTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({workoutPlanId = false, workoutSessionsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (workoutSessionsRefs) db.workoutSessions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (workoutPlanId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.workoutPlanId,
                                    referencedTable:
                                        $$WorkoutDaysTableReferences
                                            ._workoutPlanIdTable(db),
                                    referencedColumn:
                                        $$WorkoutDaysTableReferences
                                            ._workoutPlanIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (workoutSessionsRefs)
                        await $_getPrefetchedData<
                          WorkoutDay,
                          $WorkoutDaysTable,
                          WorkoutSession
                        >(
                          currentTable: table,
                          referencedTable: $$WorkoutDaysTableReferences
                              ._workoutSessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkoutDaysTableReferences(
                                db,
                                table,
                                p0,
                              ).workoutSessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workoutDayId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$WorkoutDaysTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutDaysTable,
      WorkoutDay,
      $$WorkoutDaysTableFilterComposer,
      $$WorkoutDaysTableOrderingComposer,
      $$WorkoutDaysTableAnnotationComposer,
      $$WorkoutDaysTableCreateCompanionBuilder,
      $$WorkoutDaysTableUpdateCompanionBuilder,
      (WorkoutDay, $$WorkoutDaysTableReferences),
      WorkoutDay,
      PrefetchHooks Function({bool workoutPlanId, bool workoutSessionsRefs})
    >;
typedef $$WorkoutSessionsTableCreateCompanionBuilder =
    WorkoutSessionsCompanion Function({
      Value<int> id,
      required int workoutDayId,
      Value<String> name,
      Value<String> location,
      Value<String> start,
    });
typedef $$WorkoutSessionsTableUpdateCompanionBuilder =
    WorkoutSessionsCompanion Function({
      Value<int> id,
      Value<int> workoutDayId,
      Value<String> name,
      Value<String> location,
      Value<String> start,
    });

final class $$WorkoutSessionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $WorkoutSessionsTable, WorkoutSession> {
  $$WorkoutSessionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorkoutDaysTable _workoutDayIdTable(_$AppDatabase db) =>
      db.workoutDays.createAlias(
        $_aliasNameGenerator(
          db.workoutSessions.workoutDayId,
          db.workoutDays.id,
        ),
      );

  $$WorkoutDaysTableProcessedTableManager get workoutDayId {
    final $_column = $_itemColumn<int>('workout_day_id')!;

    final manager = $$WorkoutDaysTableTableManager(
      $_db,
      $_db.workoutDays,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workoutDayIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ExercisesTable, List<Exercise>>
  _exercisesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.exercises,
    aliasName: $_aliasNameGenerator(
      db.workoutSessions.id,
      db.exercises.workoutSessionId,
    ),
  );

  $$ExercisesTableProcessedTableManager get exercisesRefs {
    final manager = $$ExercisesTableTableManager(
      $_db,
      $_db.exercises,
    ).filter((f) => f.workoutSessionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_exercisesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorkoutSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get start => $composableBuilder(
    column: $table.start,
    builder: (column) => ColumnFilters(column),
  );

  $$WorkoutDaysTableFilterComposer get workoutDayId {
    final $$WorkoutDaysTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutDayId,
      referencedTable: $db.workoutDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutDaysTableFilterComposer(
            $db: $db,
            $table: $db.workoutDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> exercisesRefs(
    Expression<bool> Function($$ExercisesTableFilterComposer f) f,
  ) {
    final $$ExercisesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.workoutSessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableFilterComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get start => $composableBuilder(
    column: $table.start,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorkoutDaysTableOrderingComposer get workoutDayId {
    final $$WorkoutDaysTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutDayId,
      referencedTable: $db.workoutDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutDaysTableOrderingComposer(
            $db: $db,
            $table: $db.workoutDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WorkoutSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get start =>
      $composableBuilder(column: $table.start, builder: (column) => column);

  $$WorkoutDaysTableAnnotationComposer get workoutDayId {
    final $$WorkoutDaysTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutDayId,
      referencedTable: $db.workoutDays,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutDaysTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutDays,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> exercisesRefs<T extends Object>(
    Expression<T> Function($$ExercisesTableAnnotationComposer a) f,
  ) {
    final $$ExercisesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.exercises,
      getReferencedColumn: (t) => t.workoutSessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExercisesTableAnnotationComposer(
            $db: $db,
            $table: $db.exercises,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorkoutSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutSessionsTable,
          WorkoutSession,
          $$WorkoutSessionsTableFilterComposer,
          $$WorkoutSessionsTableOrderingComposer,
          $$WorkoutSessionsTableAnnotationComposer,
          $$WorkoutSessionsTableCreateCompanionBuilder,
          $$WorkoutSessionsTableUpdateCompanionBuilder,
          (WorkoutSession, $$WorkoutSessionsTableReferences),
          WorkoutSession,
          PrefetchHooks Function({bool workoutDayId, bool exercisesRefs})
        > {
  $$WorkoutSessionsTableTableManager(
    _$AppDatabase db,
    $WorkoutSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> workoutDayId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<String> start = const Value.absent(),
              }) => WorkoutSessionsCompanion(
                id: id,
                workoutDayId: workoutDayId,
                name: name,
                location: location,
                start: start,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int workoutDayId,
                Value<String> name = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<String> start = const Value.absent(),
              }) => WorkoutSessionsCompanion.insert(
                id: id,
                workoutDayId: workoutDayId,
                name: name,
                location: location,
                start: start,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorkoutSessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({workoutDayId = false, exercisesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (exercisesRefs) db.exercises],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (workoutDayId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.workoutDayId,
                                    referencedTable:
                                        $$WorkoutSessionsTableReferences
                                            ._workoutDayIdTable(db),
                                    referencedColumn:
                                        $$WorkoutSessionsTableReferences
                                            ._workoutDayIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (exercisesRefs)
                        await $_getPrefetchedData<
                          WorkoutSession,
                          $WorkoutSessionsTable,
                          Exercise
                        >(
                          currentTable: table,
                          referencedTable: $$WorkoutSessionsTableReferences
                              ._exercisesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WorkoutSessionsTableReferences(
                                db,
                                table,
                                p0,
                              ).exercisesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.workoutSessionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$WorkoutSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutSessionsTable,
      WorkoutSession,
      $$WorkoutSessionsTableFilterComposer,
      $$WorkoutSessionsTableOrderingComposer,
      $$WorkoutSessionsTableAnnotationComposer,
      $$WorkoutSessionsTableCreateCompanionBuilder,
      $$WorkoutSessionsTableUpdateCompanionBuilder,
      (WorkoutSession, $$WorkoutSessionsTableReferences),
      WorkoutSession,
      PrefetchHooks Function({bool workoutDayId, bool exercisesRefs})
    >;
typedef $$ExercisesTableCreateCompanionBuilder =
    ExercisesCompanion Function({
      Value<int> id,
      required int workoutSessionId,
      Value<String> name,
      Value<double> time,
      Value<double> breakTime,
      Value<int> setNumber,
      Value<int> repNumber,
    });
typedef $$ExercisesTableUpdateCompanionBuilder =
    ExercisesCompanion Function({
      Value<int> id,
      Value<int> workoutSessionId,
      Value<String> name,
      Value<double> time,
      Value<double> breakTime,
      Value<int> setNumber,
      Value<int> repNumber,
    });

final class $$ExercisesTableReferences
    extends BaseReferences<_$AppDatabase, $ExercisesTable, Exercise> {
  $$ExercisesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutSessionsTable _workoutSessionIdTable(_$AppDatabase db) =>
      db.workoutSessions.createAlias(
        $_aliasNameGenerator(
          db.exercises.workoutSessionId,
          db.workoutSessions.id,
        ),
      );

  $$WorkoutSessionsTableProcessedTableManager get workoutSessionId {
    final $_column = $_itemColumn<int>('workout_session_id')!;

    final manager = $$WorkoutSessionsTableTableManager(
      $_db,
      $_db.workoutSessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workoutSessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get breakTime => $composableBuilder(
    column: $table.breakTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repNumber => $composableBuilder(
    column: $table.repNumber,
    builder: (column) => ColumnFilters(column),
  );

  $$WorkoutSessionsTableFilterComposer get workoutSessionId {
    final $$WorkoutSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutSessionId,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableFilterComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get breakTime => $composableBuilder(
    column: $table.breakTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get setNumber => $composableBuilder(
    column: $table.setNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repNumber => $composableBuilder(
    column: $table.repNumber,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorkoutSessionsTableOrderingComposer get workoutSessionId {
    final $$WorkoutSessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutSessionId,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableOrderingComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<double> get breakTime =>
      $composableBuilder(column: $table.breakTime, builder: (column) => column);

  GeneratedColumn<int> get setNumber =>
      $composableBuilder(column: $table.setNumber, builder: (column) => column);

  GeneratedColumn<int> get repNumber =>
      $composableBuilder(column: $table.repNumber, builder: (column) => column);

  $$WorkoutSessionsTableAnnotationComposer get workoutSessionId {
    final $$WorkoutSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.workoutSessionId,
      referencedTable: $db.workoutSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorkoutSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.workoutSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisesTable,
          Exercise,
          $$ExercisesTableFilterComposer,
          $$ExercisesTableOrderingComposer,
          $$ExercisesTableAnnotationComposer,
          $$ExercisesTableCreateCompanionBuilder,
          $$ExercisesTableUpdateCompanionBuilder,
          (Exercise, $$ExercisesTableReferences),
          Exercise,
          PrefetchHooks Function({bool workoutSessionId})
        > {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> workoutSessionId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> time = const Value.absent(),
                Value<double> breakTime = const Value.absent(),
                Value<int> setNumber = const Value.absent(),
                Value<int> repNumber = const Value.absent(),
              }) => ExercisesCompanion(
                id: id,
                workoutSessionId: workoutSessionId,
                name: name,
                time: time,
                breakTime: breakTime,
                setNumber: setNumber,
                repNumber: repNumber,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int workoutSessionId,
                Value<String> name = const Value.absent(),
                Value<double> time = const Value.absent(),
                Value<double> breakTime = const Value.absent(),
                Value<int> setNumber = const Value.absent(),
                Value<int> repNumber = const Value.absent(),
              }) => ExercisesCompanion.insert(
                id: id,
                workoutSessionId: workoutSessionId,
                name: name,
                time: time,
                breakTime: breakTime,
                setNumber: setNumber,
                repNumber: repNumber,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExercisesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({workoutSessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (workoutSessionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.workoutSessionId,
                                referencedTable: $$ExercisesTableReferences
                                    ._workoutSessionIdTable(db),
                                referencedColumn: $$ExercisesTableReferences
                                    ._workoutSessionIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisesTable,
      Exercise,
      $$ExercisesTableFilterComposer,
      $$ExercisesTableOrderingComposer,
      $$ExercisesTableAnnotationComposer,
      $$ExercisesTableCreateCompanionBuilder,
      $$ExercisesTableUpdateCompanionBuilder,
      (Exercise, $$ExercisesTableReferences),
      Exercise,
      PrefetchHooks Function({bool workoutSessionId})
    >;
typedef $$BenchmarksTableCreateCompanionBuilder =
    BenchmarksCompanion Function({
      Value<int> id,
      required int backendId,
      required int userId,
      required double bodyWeight,
      required int ex1Points,
      required int ex2Points,
      required int ex3Points,
      required int ex4Points,
      Value<bool> isToDelete,
      Value<bool> isAddedToBackend,
      Value<DateTime> createdAt,
    });
typedef $$BenchmarksTableUpdateCompanionBuilder =
    BenchmarksCompanion Function({
      Value<int> id,
      Value<int> backendId,
      Value<int> userId,
      Value<double> bodyWeight,
      Value<int> ex1Points,
      Value<int> ex2Points,
      Value<int> ex3Points,
      Value<int> ex4Points,
      Value<bool> isToDelete,
      Value<bool> isAddedToBackend,
      Value<DateTime> createdAt,
    });

class $$BenchmarksTableFilterComposer
    extends Composer<_$AppDatabase, $BenchmarksTable> {
  $$BenchmarksTableFilterComposer({
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

  ColumnFilters<double> get bodyWeight => $composableBuilder(
    column: $table.bodyWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ex1Points => $composableBuilder(
    column: $table.ex1Points,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ex2Points => $composableBuilder(
    column: $table.ex2Points,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ex3Points => $composableBuilder(
    column: $table.ex3Points,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ex4Points => $composableBuilder(
    column: $table.ex4Points,
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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BenchmarksTableOrderingComposer
    extends Composer<_$AppDatabase, $BenchmarksTable> {
  $$BenchmarksTableOrderingComposer({
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

  ColumnOrderings<double> get bodyWeight => $composableBuilder(
    column: $table.bodyWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ex1Points => $composableBuilder(
    column: $table.ex1Points,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ex2Points => $composableBuilder(
    column: $table.ex2Points,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ex3Points => $composableBuilder(
    column: $table.ex3Points,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ex4Points => $composableBuilder(
    column: $table.ex4Points,
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BenchmarksTableAnnotationComposer
    extends Composer<_$AppDatabase, $BenchmarksTable> {
  $$BenchmarksTableAnnotationComposer({
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

  GeneratedColumn<double> get bodyWeight => $composableBuilder(
    column: $table.bodyWeight,
    builder: (column) => column,
  );

  GeneratedColumn<int> get ex1Points =>
      $composableBuilder(column: $table.ex1Points, builder: (column) => column);

  GeneratedColumn<int> get ex2Points =>
      $composableBuilder(column: $table.ex2Points, builder: (column) => column);

  GeneratedColumn<int> get ex3Points =>
      $composableBuilder(column: $table.ex3Points, builder: (column) => column);

  GeneratedColumn<int> get ex4Points =>
      $composableBuilder(column: $table.ex4Points, builder: (column) => column);

  GeneratedColumn<bool> get isToDelete => $composableBuilder(
    column: $table.isToDelete,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAddedToBackend => $composableBuilder(
    column: $table.isAddedToBackend,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BenchmarksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BenchmarksTable,
          Benchmark,
          $$BenchmarksTableFilterComposer,
          $$BenchmarksTableOrderingComposer,
          $$BenchmarksTableAnnotationComposer,
          $$BenchmarksTableCreateCompanionBuilder,
          $$BenchmarksTableUpdateCompanionBuilder,
          (
            Benchmark,
            BaseReferences<_$AppDatabase, $BenchmarksTable, Benchmark>,
          ),
          Benchmark,
          PrefetchHooks Function()
        > {
  $$BenchmarksTableTableManager(_$AppDatabase db, $BenchmarksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BenchmarksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BenchmarksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BenchmarksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> backendId = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<double> bodyWeight = const Value.absent(),
                Value<int> ex1Points = const Value.absent(),
                Value<int> ex2Points = const Value.absent(),
                Value<int> ex3Points = const Value.absent(),
                Value<int> ex4Points = const Value.absent(),
                Value<bool> isToDelete = const Value.absent(),
                Value<bool> isAddedToBackend = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BenchmarksCompanion(
                id: id,
                backendId: backendId,
                userId: userId,
                bodyWeight: bodyWeight,
                ex1Points: ex1Points,
                ex2Points: ex2Points,
                ex3Points: ex3Points,
                ex4Points: ex4Points,
                isToDelete: isToDelete,
                isAddedToBackend: isAddedToBackend,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int backendId,
                required int userId,
                required double bodyWeight,
                required int ex1Points,
                required int ex2Points,
                required int ex3Points,
                required int ex4Points,
                Value<bool> isToDelete = const Value.absent(),
                Value<bool> isAddedToBackend = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BenchmarksCompanion.insert(
                id: id,
                backendId: backendId,
                userId: userId,
                bodyWeight: bodyWeight,
                ex1Points: ex1Points,
                ex2Points: ex2Points,
                ex3Points: ex3Points,
                ex4Points: ex4Points,
                isToDelete: isToDelete,
                isAddedToBackend: isAddedToBackend,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BenchmarksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BenchmarksTable,
      Benchmark,
      $$BenchmarksTableFilterComposer,
      $$BenchmarksTableOrderingComposer,
      $$BenchmarksTableAnnotationComposer,
      $$BenchmarksTableCreateCompanionBuilder,
      $$BenchmarksTableUpdateCompanionBuilder,
      (Benchmark, BaseReferences<_$AppDatabase, $BenchmarksTable, Benchmark>),
      Benchmark,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ClimbingRoutesTableTableManager get climbingRoutes =>
      $$ClimbingRoutesTableTableManager(_db, _db.climbingRoutes);
  $$WorkoutPlansTableTableManager get workoutPlans =>
      $$WorkoutPlansTableTableManager(_db, _db.workoutPlans);
  $$WorkoutDaysTableTableManager get workoutDays =>
      $$WorkoutDaysTableTableManager(_db, _db.workoutDays);
  $$WorkoutSessionsTableTableManager get workoutSessions =>
      $$WorkoutSessionsTableTableManager(_db, _db.workoutSessions);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$BenchmarksTableTableManager get benchmarks =>
      $$BenchmarksTableTableManager(_db, _db.benchmarks);
}
