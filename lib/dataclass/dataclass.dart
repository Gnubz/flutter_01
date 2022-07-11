// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ----------------------Can generate dataclass so fast !!-------------------------------------------//
class Dataclass01 {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  Dataclass01({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
    



  Dataclass01 copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return Dataclass01(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory Dataclass01.fromMap(Map<String, dynamic> map) {
    return Dataclass01(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dataclass01.fromJson(String source) => Dataclass01.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Dataclass01(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Dataclass01 &&
      other.userId == userId &&
      other.id == id &&
      other.title == title &&
      other.completed == completed;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      completed.hashCode;
  }
}
