
class Message {
  Message({
    required this.id,
    this.text,
    this.type,
    this.attachment,
    this.voice,
    required this.isMe,
  });

  int id;
  String? text;
  String? type;
  String? attachment;
  String? voice;
  bool isMe;

  Message copyWith({
  required int id,
  String? text,
  String? type,
  String? attachment,
  String? voice,
  required bool isMe,
  }) => 
    Message(
      id: id,
      text: text,
      type: type,
      attachment: attachment,
      voice: voice,
      isMe: isMe,
    );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    text: json["text"],
    type: json["type"],
    attachment: json["attachment"],
    voice: json["voice"],
    isMe: json["isMe"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "type": type,
    "attachment": attachment,
    "voice": voice,
    "isMe": isMe,
  };
}
