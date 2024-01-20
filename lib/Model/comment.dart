class Comment {
  int id;
  String commentDesc;
  String commentDate;
  String userName;
  String userImage;

  Comment({
    required this.id,
    required this.commentDesc,
    required this.commentDate,
    required this.userName,
    required this.userImage,
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
      userName: json['user_name'] as String? ?? '',
      userImage: json['user_image'] as String? ??
          'https://source.unsplash.com/random/900×700/?cat',
    );
  }
}
