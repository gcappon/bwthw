// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MealDao? _mealDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Meal` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `carbohydrates` REAL NOT NULL, `dateTime` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MealDao get mealDao {
    return _mealDaoInstance ??= _$MealDao(database, changeListener);
  }
}

class _$MealDao extends MealDao {
  _$MealDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _mealInsertionAdapter = InsertionAdapter(
            database,
            'Meal',
            (Meal item) => <String, Object?>{
                  'id': item.id,
                  'carbohydrates': item.carbohydrates,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                }),
        _mealUpdateAdapter = UpdateAdapter(
            database,
            'Meal',
            ['id'],
            (Meal item) => <String, Object?>{
                  'id': item.id,
                  'carbohydrates': item.carbohydrates,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                }),
        _mealDeletionAdapter = DeletionAdapter(
            database,
            'Meal',
            ['id'],
            (Meal item) => <String, Object?>{
                  'id': item.id,
                  'carbohydrates': item.carbohydrates,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Meal> _mealInsertionAdapter;

  final UpdateAdapter<Meal> _mealUpdateAdapter;

  final DeletionAdapter<Meal> _mealDeletionAdapter;

  @override
  Future<List<Meal>> findAllMeals() async {
    return _queryAdapter.queryList('SELECT * FROM Meal',
        mapper: (Map<String, Object?> row) => Meal(
            row['id'] as int?,
            row['carbohydrates'] as double,
            _dateTimeConverter.decode(row['dateTime'] as int)));
  }

  @override
  Future<void> insertMeal(Meal meal) async {
    await _mealInsertionAdapter.insert(meal, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMeal(Meal meal) async {
    await _mealUpdateAdapter.update(meal, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteMeal(Meal task) async {
    await _mealDeletionAdapter.delete(task);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
