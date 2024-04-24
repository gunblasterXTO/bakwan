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
}

class ActivityTable {
  static const String tableName = "activity";
  static const String id = "id";
  static const String activityName = "name";
  static const String categoryId = "category_id";
  static const String subCategoryId = "sub_category_id";
  static const String startTime = "start_time";
  static const String endTime = "end_time";
  static const String description = "description";

  static const String createTableQuery = """
    CREATE TABLE $tableName (
      $id INTEGER PRIMARY KEY,
      $activityName TEXT,
      $categoryId INTEGER,
      $subCategoryId INTEGER,
      $startTime INTEGER,
      $endTime INTEGER,
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
      $dateTime INTEGER,
      $amount REAL,
      $description TEXT,
      FOREIGN KEY ($categoryId) REFERENCES ${CategoryTable.tableName}(${CategoryTable.id}),
      FOREIGN KEY ($subCategoryId) REFERENCES ${SubCategoryTable.tableName}(${SubCategoryTable.id})
    )
  """;
}
