import 'package:m_expense/core/database/db_credentials.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseService {
  const LocalDatabaseService._();

  static final LocalDatabaseService instance = LocalDatabaseService._();
  static Database? _database;



  Future<Database> get database async {
    if(_database != null){
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, DbCredentials.dbName);
    return openDatabase(path, version: DbCredentials.version, onCreate: _createDatabase, onUpgrade: _upgradeDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await _createExpensesTable(db);
    await _createProfileTable(db);
    await _insertDefaultProfile(db);
  }

  Future<void> _upgradeDatabase(
      Database db,
      int oldVersion,
      int newVersion,
      ) async {
    if (oldVersion < 2) {
      await _createProfileTable(db);
      await _insertDefaultProfile(db);
    }
  }

  Future<void> _createExpensesTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${DbCredentials.expensesTable} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL NOT NULL,
        category TEXT NOT NULL,
        note TEXT,
        date TEXT NOT NULL,
        createdAt TEXT NOT NULL
      )
    ''');
  }

  Future<void> _createProfileTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${DbCredentials.profileTable} (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        monthlyBudget REAL NOT NULL,
        currencyCode TEXT NOT NULL,
        currencyName TEXT NOT NULL,
        currencySymbol TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL
      )
    ''');
  }

  Future<void> _insertDefaultProfile(Database db) async {
    final now = DateTime.now().toIso8601String();

    await db.insert(
      'profile',
      {
        'id': 1,
        'name': 'Alex Thompson',
        'email': 'alex.thompson@example.com',
        'monthlyBudget': 2500.0,
        'currencyCode': 'USD',
        'currencyName': 'US Dollar',
        'currencySymbol': r'$',
        'createdAt': now,
        'updatedAt': now,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }


}