part of 'models.dart';

// To parse this JSON data, do
//
//     final jobModel = jobModelFromJson(jsonString);

class JobModel {
  JobModel({
    this.id,
    this.name,
    this.category,
    this.companyName,
    this.companyLogo,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.about,
    this.qualification,
    this.responsibility,
  });

  int id;
  String name;
  String category;
  String companyName;
  String companyLogo;
  String location;
  int createdAt;
  int updatedAt;
  List<About> about;
  List<About> qualification;
  List<About> responsibility;

  factory JobModel.fromRawJson(String str) =>
      JobModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        companyName: json["company_name"],
        companyLogo: json["company_logo"],
        location: json["location"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        qualification: List<About>.from(
            json["qualification"].map((x) => About.fromJson(x))),
        responsibility: List<About>.from(
            json["responsibility"].map((x) => About.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "company_name": companyName,
        "company_logo": companyLogo,
        "location": location,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "qualification":
            List<dynamic>.from(qualification.map((x) => x.toJson())),
        "responsibility":
            List<dynamic>.from(responsibility.map((x) => x.toJson())),
      };
}

class About {
  About({
    this.id,
    this.name,
    this.jobId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String jobId;
  dynamic createdAt;
  dynamic updatedAt;

  factory About.fromRawJson(String str) => About.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory About.fromJson(Map<String, dynamic> json) => About(
        id: json["id"],
        name: json["name"],
        jobId: json["job_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "job_id": jobId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
