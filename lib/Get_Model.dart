// To parse this JSON data, do
//
//     final getModelTest = getModelTestFromJson(jsonString);

import 'dart:convert';

GetModelTest getModelTestFromJson(String str) => GetModelTest.fromJson(json.decode(str));

String getModelTestToJson(GetModelTest data) => json.encode(data.toJson());

class GetModelTest {
  int userId;
  int id;
  String title;

  GetModelTest({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory GetModelTest.fromJson(Map<String, dynamic> json) => GetModelTest(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
