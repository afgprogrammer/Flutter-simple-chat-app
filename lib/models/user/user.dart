import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profile,
  });

  int id;
  String name;
  String email;
  String profile;

  User copyWith({
    required int id,
    required String name,
    required String email,
    required String profile,
  }) => 
    User(
      id: id,
      name: name,
      email: email,
      profile: profile,
    );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    profile: json["profile"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "profile": profile,
  };
}
