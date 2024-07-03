// To parse this JSON data, do
//
//     final jobDetailsModel = jobDetailsModelFromJson(jsonString);

import 'dart:convert';

JobDetailsModel jobDetailsModelFromJson(String str) => JobDetailsModel.fromJson(json.decode(str));

String jobDetailsModelToJson(JobDetailsModel data) => json.encode(data.toJson());

class JobDetailsModel {
  bool status;
  String message;
  Data data;

  JobDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) => JobDetailsModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
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

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
