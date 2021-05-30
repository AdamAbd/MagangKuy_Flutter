part of 'models.dart';

// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
    this.picturePath,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String picturePath;
  int createdAt;
  int updatedAt;

  factory CategoryModel.fromRawJson(String str) =>
      CategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        picturePath: json["picture_path"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "picture_path": picturePath,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
