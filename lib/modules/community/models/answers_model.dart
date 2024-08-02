// To parse this JSON data, do
//
//     final answersModel = answersModelFromJson(jsonString);

import 'dart:convert';

AnswersModel answersModelFromJson(String str) => AnswersModel.fromJson(json.decode(str));

String answersModelToJson(AnswersModel data) => json.encode(data.toJson());

class AnswersModel {
  bool status;
  String message;
  List<Datum> data;

  AnswersModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AnswersModel.fromJson(Map<String, dynamic> json) => AnswersModel(
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
  int id;
  String name;
  dynamic image;
  bool isAuth;
  String time;
  int likesCount;
  String content;
  bool isMine;
  bool isLiked;

  Datum({
    required this.id,
    required this.name,
    required this.image,
    required this.isAuth,
    required this.time,
    required this.likesCount,
    required this.content,
    required this.isMine,
    required this.isLiked,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    isAuth: json["is_auth"],
    time: json["time"],
    likesCount: json["likes_count"],
    content: json["content"],
    isMine: json["is_mine"],
    isLiked: json["is_liked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "is_auth": isAuth,
    "time": time,
    "likes_count": likesCount,
    "content": content,
    "is_mine": isMine,
    "is_liked": isLiked,
  };
}
