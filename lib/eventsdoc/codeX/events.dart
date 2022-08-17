import 'dart:convert';

Events eventsFromJson(String str) => Events.fromJson(json.decode(str));

String eventsToJson(Events data) => json.encode(data.toJson());

class Events {
  Events({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.public,
  });

  String id;
  String title;
  String date;
  String description;
  String public;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        id: json["id"],
        title: json["title"],
        date: json["date"],
        description: json["description"],
        public: json["public"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date": date,
        "description": description,
        "public": public,
      };
}
