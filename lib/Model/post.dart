class Post {
  String id;
  String postBy;
  String description;
  String image;
  int upVote_count;
  int downVote_count;
  DateTime createdAt;
  DateTime updatedAt;
  Post({
    required this.id,
    required this.postBy,
    required this.description,
    required this.image,
    required this.upVote_count,
    required this.downVote_count,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      description: json['description'],
      image: json['image'],
      upVote_count: json['up_vote_count'],
      downVote_count: json['down_vote_count'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      postBy: json['post_by'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'image': image,
      'up_vote_count': upVote_count,
      'down_vote_count': downVote_count,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'post_by': postBy
    };
  }
}
