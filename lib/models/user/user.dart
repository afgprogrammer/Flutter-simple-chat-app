import 'dart:convert';

import 'package:day60/models/story/story.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profile,
    this.stories,
  });

  int id;
  String name;
  String email;
  String profile;
  List<Story>? stories;

  User copyWith({
    required int id,
    required String name,
    required String email,
    required String profile,
    List<Story>? stories,
  }) => 
    User(
      id: id,
      name: name,
      email: email,
      profile: profile,
      stories: stories,
    );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    profile: json["profile"],
    stories: List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "profile": profile,
    "stories": List<dynamic>.from(stories!.map((x) => x.toJson())),
  };
}
