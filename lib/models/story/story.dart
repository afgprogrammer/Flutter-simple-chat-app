import 'dart:convert';

Story storyFromJson(String str) => Story.fromJson(json.decode(str));

String storyToJson(Story data) => json.encode(data.toJson());

class Story {
  Story({
    required this.url,
  });

  String url;

  Story copyWith({required String url}) => Story(url: url);

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}
