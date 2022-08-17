// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppEvent {
  final String title;
  final String id;
  final String description;
  final DateTime date;
  final String userId;
  final bool public;
  AppEvent({
    required this.title,
    required this.id,
    required this.description,
    required this.date,
    required this.userId,
    required this.public,
  });

  AppEvent copyWith({
    String? title,
    String? id,
    String? description,
    DateTime? date,
    String? userId,
    bool? public,
  }) {
    return AppEvent(
      title: title ?? this.title,
      id: id ?? this.id,
      description: description ?? this.description,
      date: date ?? this.date,
      userId: userId ?? this.userId,
      public: public ?? this.public,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'userId': userId,
      'public': public,
    };
  }

  factory AppEvent.fromMap(String id, Map<String, dynamic> map) {
    return AppEvent(
      title: map['title'] as String,
      id: id,
      description: map['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      userId: map['userId'] as String,
      public: map['public'] as bool,
    );
  }
  factory AppEvent.fromDS(String id ,Map<String, dynamic> map, [Map<String, dynamic>? data]) {
    return AppEvent(
      title: map['title'] as String,
      id: id,
      description: map['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      userId: map['userId'] as String,
      public: map['public'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AppEvent(title: $title, id: $id, description: $description, date: $date, userId: $userId, public: $public)';
  }

  @override
  bool operator ==(covariant AppEvent other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.id == id &&
        other.description == description &&
        other.date == date &&
        other.userId == userId &&
        other.public == public;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        id.hashCode ^
        description.hashCode ^
        date.hashCode ^
        userId.hashCode ^
        public.hashCode;
  }
}
