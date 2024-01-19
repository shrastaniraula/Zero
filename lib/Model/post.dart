class Post {
  int? id;
  String? postBy;
  String? description;
  String? image;
  int? upVote_count;
  String? posted_date;
  String? post_time;
  String? tag;

  Post({
    this.id,
    this.postBy,
    this.description,
    this.image,
    this.upVote_count,
    this.posted_date,
    this.post_time,
    this.tag,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['post_id'],
      description: json['post_desc'],
      image: json['image'],
      upVote_count: json['up_vote'],
      posted_date: json['posted_date'],
      post_time: json['post_time'],
      postBy: json['user_name'],
      tag: json['tag'],
    );
  }
}
