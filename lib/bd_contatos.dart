import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    return _db;
      _db = await initDatabase();
    return _db;
  }

  Future<Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'contatos.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Contatos (
        id INTEGER PRIMARY KEY,
        nome TEXT,
        endereco TEXT,
        cpf TEXT,
        email TEXT,
        telefone TEXT,
        avatar TEXT
      )
    ''');
  }
}