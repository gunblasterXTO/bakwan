import 'dart:io';

import 'package:bakwan/database/definition.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBInstance extends GetxController {
  final String _dbName = "bakwan.db";
  final int _dbVersion = 1;
  late Database _database;

  Database get database => _database;

  @override
  void onInit() {
    super.onInit();
    _initDatabase();
  }

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    _database = await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
    print(path);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(CategoryTable.createTableQuery);
    await db.execute(SubCategoryTable.createTableQuery);
    await db.execute(ActivityTable.createTableQuery);
    await db.execute(ExpenseTable.createTableQuery);
  }
}
