class CategoryTable {
  static const String tableName = "category";
  static const String id = "id";
  static const String categoryName = "name";

  static const String createTableQuery = """
    CREATE TABLE $tableName (
      $id INTEGER PRIMARY KEY,
      $categoryName TEXT
    )
  """;

  static const String dropTableQuery = "DROP TABLE IF EXISTS $tableName";

  static const String insertQuery = """
    INSERT INTO $tableName ($categoryName)
    VALUES
      ('Work'),
      ('Study')
  """;
}

class SubCategoryTable {
  static const String tableName = "sub_category";
  static const String id = "id";
  static const String categoryId = "category_id";
  static const String subCategoryName = "name";

  static const String createTableQuery = """
    CREATE TABLE $tableName (
      $id INTEGER PRIMARY KEY,
      $categoryId INTEGER,
      $subCategoryName TEXT,
      FOREIGN KEY ($categoryId) REFERENCES ${CategoryTable.tableName}(${CategoryTable.id})
    )
  """;

  static const String dropTableQuery = "DROP TABLE IF EXISTS $tableName";

  static const String insertQuery = """
    INSERT INTO $tableName ($categoryId, $subCategoryName)
    VALUES
      (1, 'Daily Meeting'),
      (1, 'Project Meeting'),
      (1, 'Coding'),
      (1, 'Sprint Meeting'),
      (2, 'Explore'),
      (2, 'Deep dive')
  """;
}

class ActivityTable {
  static const String tableName = "activity";
  static const String id = "id";
  static const String activityName = "name";
  static const String categoryId = "category_id";
  static const String subCategoryId = "sub_category_id";
  static const String date = "date";
  static const String startTime = "start_time";
  static const String endTime = "end_time";
  static const String description = "description";

  static const String createTableQuery = """
    CREATE TABLE $tableName (
      $id INTEGER PRIMARY KEY,
      $activityName TEXT,
      $categoryId INTEGER,
      $subCategoryId INTEGER,
      $date TEXT
      $startTime TEXT,
      $endTime TEXT,
      $description TEXT,
      FOREIGN KEY ($categoryId) REFERENCES ${CategoryTable.tableName}(${CategoryTable.id}),
      FOREIGN KEY ($subCategoryId) REFERENCES ${SubCategoryTable.tableName}(${SubCategoryTable.id})
    )
  """;
}

class ExpenseTable {
  static const String tableName = "expense";
  static const String id = "id";
  static const String expenseName = "name";
  static const String categoryId = "category_id";
  static const String subCategoryId = "sub_category_id";
  static const String dateTime = "date_time";
  static const String amount = "amount";
  static const String description = "description";

  static const String createTableQuery = """
    CREATE TABLE $tableName (
      $id INTEGER PRIMARY KEY,
      $expenseName TEXT,
      $categoryId INTEGER,
      $subCategoryId INTEGER,
      $dateTime TEXT,
      $amount REAL,
      $description TEXT,
      FOREIGN KEY ($categoryId) REFERENCES ${CategoryTable.tableName}(${CategoryTable.id}),
      FOREIGN KEY ($subCategoryId) REFERENCES ${SubCategoryTable.tableName}(${SubCategoryTable.id})
    )
  """;
}
