import 'package:bakwan/common/models/base.dart';

class ActivityModel extends BaseModel {
  String? categoryName;
  String? subCategoryName;
  String? startTime;
  String? endTime;
  String? description;

  ActivityModel({
    required super.id,
    required super.name,
    this.categoryName,
    this.subCategoryName,
    this.startTime,
    this.endTime,
    this.description,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json["id"],
      name: json["name"],
      categoryName: json["category_name"],
      subCategoryName: json["sub_category_name"],
      startTime: json["start_time"],
      endTime: json["end_time"],
      description: json["description"],
    );
  }
}

class UpsertActivityModel {
  String title;
  String startTime;
  String endTime;
  int? id;
  int? categoryId;
  int? subCategoryId;
  String? description;

  UpsertActivityModel({
    required this.title,
    required this.startTime,
    required this.endTime,
    this.id,
    this.categoryId,
    this.subCategoryId,
    this.description,
  });
}
