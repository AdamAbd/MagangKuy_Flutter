part of 'models.dart';

// To parse this JSON data, do
//
//     final applicationModel = applicationModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final applicationModel = applicationModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final applicationModel = applicationModelFromJson(jsonString);

class ApplicationModel {
  ApplicationModel({
    this.id,
    this.userId,
    this.jobId,
    this.apply,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  int jobId;
  String apply;
  DateTime createdAt;
  DateTime updatedAt;

  factory ApplicationModel.fromRawJson(String str) =>
      ApplicationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      ApplicationModel(
        id: json["id"],
        userId: json["user_id"],
        jobId: json["job_id"],
        apply: json["apply"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "job_id": jobId,
        "apply": apply,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
