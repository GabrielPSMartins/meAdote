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
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        role TEXT NOT NULL DEFAULT 'adopter',
        phone TEXT,
        city TEXT,
        state TEXT,
        org_name TEXT,
        org_cnpj TEXT,
        org_type TEXT
      );
    ''');

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

    await _seedPosts(db);
  }

  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute(
          "ALTER TABLE users ADD COLUMN role TEXT NOT NULL DEFAULT 'adopter'");
      await db.execute('ALTER TABLE users ADD COLUMN phone TEXT');
      await db.execute('ALTER TABLE users ADD COLUMN city TEXT');
      await db.execute('ALTER TABLE users ADD COLUMN state TEXT');
      await db.execute('ALTER TABLE users ADD COLUMN org_name TEXT');
      await db.execute('ALTER TABLE users ADD COLUMN org_cnpj TEXT');
      await db.execute('ALTER TABLE users ADD COLUMN org_type TEXT');
    }
  }

  Future _seedPosts(Database db) async {
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM posts'),
    );
    if (count != null && count > 0) return;

    await db.insert('posts', {
      'userName': 'ONG Amigos dos Animais',
      'title': 'Thor procura um lar',
      'description':
          'Cachorro dócil, vacinado e castrado. Ideal para apartamento.',
      'type': 'disponivel',
      'species': 'Cachorro',
      'city': 'Itajubá',
      'state': 'MG',
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
