// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';

CompanyModel companyModelFromJson(String str) => CompanyModel.fromJson(json.decode(str));

String companyModelToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
  bool status;
  String message;
  List<Datum> data;

  CompanyModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
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
  String companyImage;

  Datum({
    required this.companyName,
    required this.companyImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    companyName: json["company_name"],
    companyImage: json["company_image"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "company_image": companyImage,
  };
}
