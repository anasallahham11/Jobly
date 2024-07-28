// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    bool status;
    String message;
    Data data;

    ProfileModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
    int id;
    String name;
    String email;
    int role;
    int authentication;
    int ban;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;
    Employee employee;
    Address address;

    Data({
        required this.id,
        required this.name,
        required this.email,
        required this.role,
        required this.authentication,
        required this.ban,
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.employee,
        required this.address,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        authentication: json["authentication"],
        ban: json["ban"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        employee: Employee.fromJson(json["employee"]),
        address: Address.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "authentication": authentication,
        "ban": ban,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "employee": employee.toJson(),
        "address": address.toJson(),
    };
}

class Address {
    int id;
    int userId;
    String county;
    String city;
    String governorate;
    DateTime createdAt;
    DateTime updatedAt;

    Address({
        required this.id,
        required this.userId,
        required this.county,
        required this.city,
        required this.governorate,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["user_id"],
        county: json["county"],
        city: json["city"],
        governorate: json["Governorate"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "county": county,
        "city": city,
        "Governorate": governorate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Employee {
    int id;
    int userId;
    dynamic cv;
    DateTime dateOfBirth;
    String resume;
    String experience;
    String education;
    String portfolio;
    String phoneNumber;
    String workStatus;
    String graduationStatus;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic image;
    dynamic video;
    List<dynamic> skills;

    Employee({
        required this.id,
        required this.userId,
        required this.cv,
        required this.dateOfBirth,
        required this.resume,
        required this.experience,
        required this.education,
        required this.portfolio,
        required this.phoneNumber,
        required this.workStatus,
        required this.graduationStatus,
        required this.createdAt,
        required this.updatedAt,
        required this.image,
        required this.video,
        required this.skills,
    });

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        userId: json["user_id"],
        cv: json["cv"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        resume: json["resume"],
        experience: json["experience"],
        education: json["education"],
        portfolio: json["portfolio"],
        phoneNumber: json["phone_number"],
        workStatus: json["work_status"],
        graduationStatus: json["graduation_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        video: json["video"],
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "cv": cv,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "resume": resume,
        "experience": experience,
        "education": education,
        "portfolio": portfolio,
        "phone_number": phoneNumber,
        "work_status": workStatus,
        "graduation_status": graduationStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
        "video": video,
        "skills": List<dynamic>.from(skills.map((x) => x)),
    };
}
