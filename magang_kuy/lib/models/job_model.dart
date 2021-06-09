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
    this.salary,
    this.description,
    this.qualifications,
    this.responsibilities,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String category;
  String companyName;
  String companyLogo;
  String location;
  String salary;
  String description;
  List<Qualification> qualifications;
  List<Qualification> responsibilities;
  int createdAt;
  int updatedAt;

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
        salary: json["salary"],
        description: json["description"],
        qualifications: List<Qualification>.from(
            json["qualifications"].map((x) => Qualification.fromJson(x))),
        responsibilities: List<Qualification>.from(
            json["responsibilities"].map((x) => Qualification.fromJson(x))),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "company_name": companyName,
        "company_logo": companyLogo,
        "location": location,
        "salary": salary,
        "description": description,
        "qualifications":
            List<dynamic>.from(qualifications.map((x) => x.toJson())),
        "responsibilities":
            List<dynamic>.from(responsibilities.map((x) => x.toJson())),
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Qualification {
  Qualification({
    this.name,
  });

  String name;

  factory Qualification.fromRawJson(String str) =>
      Qualification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Qualification.fromJson(Map<String, dynamic> json) => Qualification(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
