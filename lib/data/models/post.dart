import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.id,
    required this.title,
    required this.postAbstract,
    required this.body,
    required this.photo,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final int id;
  final String title;
  final String postAbstract;
  final String body;
  final String photo;
  final String category;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        postAbstract: json["abstract"],
        body: json["body"],
        photo: json["photo"],
        category: json["category"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"] == null
            ? null
            : DateTime.parse(json["deletedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "abstract": postAbstract,
        "body": body,
        "photo": photo,
        "category": category,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt?.toIso8601String(),
      };
}

class NewPost {
  NewPost();

  String? title;
  String? postAbstract;
  String? body;
  String? photo;
  String? category;
}
