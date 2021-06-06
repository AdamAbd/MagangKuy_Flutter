part of 'models.dart';

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.picturePath,
    this.goal,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String email;
  String picturePath;
  String goal;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        picturePath: json["picture_path"],
        goal: json["goal"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "picture_path": picturePath,
        "goal": goal,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
