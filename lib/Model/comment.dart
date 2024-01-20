class Comment {
  int id;
  String commentDesc;
  String commentDate;

  Comment({
    required this.id,
    required this.commentDesc,
    required this.commentDate,
  });

  factory Comment.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      // Handle the case where json is null (e.g., if parsing fails)
      throw FormatException("Failed to parse JSON");
    }

    return Comment(
      id: json['comment_id'] as int? ?? 0,
      commentDesc: json['comment_desc'] as String? ?? '',
      commentDate: json['comment_date'] as String? ?? '',
    );
  }
}
