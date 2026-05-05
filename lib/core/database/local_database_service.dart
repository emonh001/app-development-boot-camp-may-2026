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
    return openDatabase(path, version: DbCredentials.version, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute(
        '''
      CREATE TABLE ${DbCredentials.expensesTable} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL NOT NULL,
        category TEXT NOT NULL,
        note TEXT,
        date TEXT NOT NULL,
        createdAt TEXT NOT NULL
      )
    '''
    );
  }


}