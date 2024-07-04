// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  bool status;
  String message;
  List<Datum> data;

  SearchModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String companyName;
  String section;
  String category;
  int vacancyId;
  int userId;
  String description;
  String? vacancyImage;
  String? publisherPhoto;
  String jobType;
  String status;
  String requirements;
  String? salaryRange;
  DateTime applicationDeadline;
  dynamic location;

  Datum({
    required this.companyName,
    required this.section,
    required this.category,
    required this.vacancyId,
    required this.userId,
    required this.description,
     this.vacancyImage,
     this.publisherPhoto,
    required this.jobType,
    required this.status,
    required this.requirements,
     this.salaryRange,
    required this.applicationDeadline,
     this.location,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    companyName: json["company_name"],
    section: json["section"],
    category: json["category"],
    vacancyId: json["vacancy_id"],
    userId: json["user_id"],
    description: json["description"],
    vacancyImage: json["vacancy_image"],
    publisherPhoto: json["publisher_photo"],
    jobType: json["job_type"],
    status: json["status"],
    requirements: json["requirements"],
    salaryRange: json["salary_range"],
    applicationDeadline: DateTime.parse(json["application_deadline"]),
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "section": section,
    "category": category,
    "vacancy_id": vacancyId,
    "user_id": userId,
    "description": description,
    "vacancy_image": vacancyImage,
    "publisher_photo": publisherPhoto,
    "job_type": jobType,
    "status": status,
    "requirements": requirements,
    "salary_range": salaryRange,
    "application_deadline": "${applicationDeadline.year.toString().padLeft(4, '0')}-${applicationDeadline.month.toString().padLeft(2, '0')}-${applicationDeadline.day.toString().padLeft(2, '0')}",
    "location": location,
  };
}
