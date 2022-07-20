
class Message {
  Message({
    required this.id,
    this.text,
    this.type,
    this.attachment,
    this.voice,
    required this.createdAt,
    required this.isMe,
  });

  int id;
  String? text;
  String? type;
  String? attachment;
  String? voice;
  String createdAt;
  bool isMe;

  Message copyWith({
  required int id,
  String? text,
  String? type,
  String? attachment,
  String? voice,
  required String createdAt,
  required bool isMe,
  }) => 
    Message(
      id: id,
      text: text,
      type: type,
      attachment: attachment,
      voice: voice,
      isMe: isMe,
      createdAt: createdAt,
    );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    text: json["text"],
    type: json["type"],
    attachment: json["attachment"],
    voice: json["voice"],
    isMe: json["isMe"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "type": type,
    "attachment": attachment,
    "voice": voice,
    "isMe": isMe,
    "createdAt": createdAt,
  };
}
