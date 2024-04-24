import 'package:bakwan/common/models/base.dart';

class SubCategoryModel extends BaseModel {
  SubCategoryModel({
    required super.id,
    required super.name,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
