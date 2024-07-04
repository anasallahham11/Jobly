///what is this ?
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'dart:convert';

CompanyModel companyModelFromJson(String str) => CompanyModel.fromJson(json.decode(str));

String companyModelToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel{
   bool status;
  String message;
  Datum data;


  CompanyModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    status: json["status"],
    message: json["message"],
    data: Datum.fromJson(json["data"]),
    // data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };


}

class AddressModel{
  int id;
  int userId;
  //طلعت هيك صح مقاطعة مو بلد 
  String county;
  String city;
  String governorate;

  AddressModel({
    required this.id,
    required this.userId,
    required this.county,
    required this.city,
    required this.governorate

  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json["id"],
    userId: json["user_id"],
    county: json["county"],
    city: json["city"],
    governorate: json["Governorate"],
 
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "county": county,
    "city": city,
    "Governorate": governorate,
    
  };



}

class Datum {
  int id ;
  int userId;
  String dateOfEstablishment;
  int numberOfEmployees;
  String commercialRecord;
  String companyName;
  String phoneNumber;
  String industry;
  String companyAboutUs;
  String companyWebsite;
  String companyEmail;
  String contactPerson;
  List<AddressModel>address;
  List<double>rating;



  Datum({
    required this.id,
    required this.userId,
    required this.dateOfEstablishment,
    required this.numberOfEmployees,
    required this.commercialRecord,
    required this.companyName,
    required this.phoneNumber,
    required this.industry,
    required this.companyAboutUs,
    required this.companyWebsite,
    required this.companyEmail,
    required this.contactPerson,
    required this.address,
    required this.rating,
    
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    dateOfEstablishment: json["Date_of_Establishment"],
    numberOfEmployees: json["employe_number"],
    commercialRecord: json["Commercial_Record"],
    companyName: json["company_name"],
    phoneNumber: json["contact_phone"],
    industry: json["industry"],
    companyAboutUs: json["company_description"],
    companyWebsite: json["company_website"],
    companyEmail: json["contact_email"],
    contactPerson: json["contact_person"],
    //data model
    address: json["address"],
    //list
    rating: json["ratings"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "Date_of_Establishment": dateOfEstablishment,
    "employe_number": numberOfEmployees,
    "Commercial_Record": commercialRecord,
    "company_name": companyName,
    "contact_phone": phoneNumber,
    "industry": industry,
    "company_description": companyAboutUs,
    "company_website": companyWebsite,
    "contact_email": companyEmail,
    "contact_person": contactPerson,
    "address":address,
    "ratings": rating,
  };
}
///response
/* 
{
    "status": true,
    "message": "success",
    "data": {
        "id": 1,
        "user_id": 12,
        "Date_of_Establishment": "2023-01-02",
        "employe_number": 309,
        "Commercial_Record": "company.jpg",
        "company_name": "Flatley Group",
        "contact_phone": "+17249123405",
        "industry": "autem",
        "company_description": "Sunt qui natus quisquam. Ullam et quibusdam ea. Tenetur esse optio recusandae beatae consequatur ut velit. Consectetur minima quibusdam facere consequatur.",
        "company_website": "http://www.deckow.net/libero-quasi-explicabo-dignissimos-id-beatae-sed-voluptates",
        "contact_email": "melyssa57@lesch.com",
        "contact_person": "Jazmyn Larson",
        "created_at": "2024-07-02T16:19:15.000000Z",
        "updated_at": "2024-07-02T16:19:15.000000Z",
        "address": {
            "id": 12,
            "user_id": 12,
            "county": "Virginia",
            "city": "Schroederhaven",
            "Governorate": "New Hampshire",
            "created_at": "2024-07-02T16:19:15.000000Z",
            "updated_at": "2024-07-02T16:19:15.000000Z"
        },
        "ratings": []
    }
}
*/