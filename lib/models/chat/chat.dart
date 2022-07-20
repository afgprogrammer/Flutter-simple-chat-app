import 'dart:convert';

import 'package:day60/models/message/message.dart';
import 'package:day60/models/user/user.dart';

Chat chatFromJson(String str) => Chat.fromJson(json.decode(str));

String chatToJson(Chat data) => json.encode(data.toJson());

class Chat {
  Chat({
    required this.id,
    required this.user,
    required this.messages,
    required this.unReadCount,
    required this.lastMessageAt,
  });

  int id;
  User user;
  List<Message> messages;
  int unReadCount;
  String lastMessageAt;

  Chat copy() => Chat(
    id: id,
    user: user,
    messages: messages,
    unReadCount: unReadCount,
    lastMessageAt: lastMessageAt,
  );

  Chat copyWith({
    required int id,
    required User user,
    required List<Message> messages,
    required int unReadCount,
    required String lastMessageAt,
  }) => 
    Chat(
      id: id,
      user: user,
      messages: messages,
      unReadCount: unReadCount,
      lastMessageAt: lastMessageAt
    );

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    id: json["id"],
    user: User.fromJson(json["user"]),
    unReadCount: json["unReadCount"],
    lastMessageAt: json["lastMessageAt"],
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user.toJson(),
    "unReadCount": unReadCount,
    "lastMessageAt": lastMessageAt,
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
  };
}
