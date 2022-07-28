// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

List<ProfileModel> profileModelFromJson(String str) => List<ProfileModel>.from(
    json.decode(str).map((x) => ProfileModel.fromJson(x)));

String profileModelToJson(List<ProfileModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileModel {
  ProfileModel({
    this.createdAt,
    this.name,
    this.avatar,
    this.id,
  });

  DateTime? createdAt;
  String? name;
  String? avatar;
  String? id;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "id": id,
      };
}
