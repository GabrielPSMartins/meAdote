import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static final DatabaseProvider instance = DatabaseProvider._init();
  static Database? _database;

  DatabaseProvider._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('meadote.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future _createDB(Database db, int version) async {
    // ---- TABELA USERS ----
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      );
    ''');

    // ---- TABELA ANIMALS ----
    await db.execute('''
      CREATE TABLE animals(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age TEXT,
        type TEXT,
        description TEXT,
        image TEXT
      );
    ''');

    // ---- TABELA POSTS ----
    await db.execute('''
      CREATE TABLE posts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userName TEXT,
        userAvatar TEXT,
        title TEXT NOT NULL,
        description TEXT,
        type TEXT,
        species TEXT,
        size TEXT,
        city TEXT,
        state TEXT,
        createdAt TEXT,
        images TEXT
      );
    ''');

    // ---- TABELA ONG ----
    await db.execute('''
      CREATE TABLE ong(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        city TEXT NOT NULL,
        imageUrl TEXT
      );
    ''');
  }


  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Criar tabela ONG
      await db.execute('''
        CREATE TABLE ong(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT NOT NULL UNIQUE,
          password TEXT NOT NULL,
          city TEXT NOT NULL,
          imageUrl TEXT
        );
      ''');
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
