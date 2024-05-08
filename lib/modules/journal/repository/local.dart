import 'package:bakwan/common/utils/generator.dart';
import 'package:bakwan/database/definition.dart';
import 'package:bakwan/modules/journal/models/activity.dart';
import 'package:bakwan/modules/journal/models/category.dart';
import 'package:bakwan/modules/journal/models/sub_category.dart';
import 'package:sqflite/sqflite.dart';

class ActivityDao {
  final Database db;

  ActivityDao({required this.db});

  Future<List<ActivityModel>> getAll(bool mapFk) async {
    final String query = _queryGetAllMapped();
    final data = await db.rawQuery(query);
    List<ActivityModel> result =
        data.map((e) => ActivityModel.fromJson(e)).toList();
    return result;
  }

  void upsertRecord(UpsertActivityModel model) async {
    if (model.id == null) {
      final String query = _queryInsertRecord(model);
      await db.rawInsert(query);
    } else {
      final String query = _queryUpdateRecord(model);
      await db.rawUpdate(query);
    }
  }

  String _queryInsertRecord(UpsertActivityModel model) {
    String date = Generator.todayDate();
    return '''
      INSERT INTO ${ActivityTable.tableName}(${ActivityTable.activityName}, ${ActivityTable.categoryId}, ${ActivityTable.subCategoryId}, ${ActivityTable.date}, ${ActivityTable.startTime}, ${ActivityTable.endTime}, ${ActivityTable.description})
        VALUES (${model.title}, ${model.categoryId}, ${model.subCategoryId}, $date, ${model.startTime}, ${model.endTime}, ${model.description})
    ''';
  }

  String _queryUpdateRecord(UpsertActivityModel model) {
    return '''
      UPDATE ${ActivityTable.tableName}
      SET
        ${ActivityTable.activityName} = ${model.title},
        ${ActivityTable.categoryId} = ${model.categoryId},
        ${ActivityTable.subCategoryId} = ${model.subCategoryId},
        ${ActivityTable.startTime} = ${model.startTime},
        ${ActivityTable.endTime} = ${model.endTime},
        ${ActivityTable.description} = ${model.description}
      WHERE
        ${ActivityTable.id} = ${model.id!}
    ''';
  }

  String _queryGetAllMapped() {
    return '''
      SELECT
        a.id,
        a.name,
        c.name AS category_name,
        sc.name AS sub_category_name,
        a.start_time,
        a.end_time,
        a.description
      FROM activity AS a
      JOIN category AS c ON c.id = a.category_id
      JOIN sub_category AS sc ON sc.id = a.sub_category_id
    ''';
  }
}

class CategoryDao {
  final Database db;

  CategoryDao({required this.db});

  Future<List<CategoryModel>> getAll() async {
    final String query = _quertyGetAll();
    final data = await db.rawQuery(query);
    List<CategoryModel> result =
        data.map((e) => CategoryModel.fromJson(e)).toList();
    return result;
  }

  String _quertyGetAll() {
    return '''
      SELECT *
      FROM category
    ''';
  }
}

class SubCategoryDao {
  final Database db;

  SubCategoryDao({required this.db});

  Future<List<SubCategoryModel>> getAllFromCat(int id) async {
    final String query = _quertyGetAllFromCat(id);
    final data = await db.rawQuery(query);
    List<SubCategoryModel> result =
        data.map((e) => SubCategoryModel.fromJson(e)).toList();
    return result;
  }

  String _quertyGetAllFromCat(int id) {
    return '''
      SELECT *
      FROM sub_category AS sc
      WHERE sc.category_id = $id
    ''';
  }
}
