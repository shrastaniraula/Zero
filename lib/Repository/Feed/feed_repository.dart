import 'dart:convert';

import 'package:zero/Model/comment.dart';
import 'package:zero/Model/post.dart';
import 'package:dio/dio.dart';
import 'package:zero/Repository/Core/endpoints.dart';

class FeedRepository {
  final Dio _dioClient = Dio();
  get10Posts() async {
    List<Post> futurePosts = [];
    try {
      final response = await _dioClient.get(
        Endpoints.getPost,
      );
      if (response.statusCode == 200) {
        print("done1");
        final responseData = response.data;
        print("done2");
        print(response.data);
        try {
          futurePosts.addAll(
            (responseData as List).map(
              (post) => Post.fromJson(post),
            ),
          );
        } catch (e) {
          print(e);
        }

        print("done");
        return futurePosts.reversed.toList();
      } else {
        return false;
      }
    } on DioError catch (e) {
      return false;
    }
  }

  getPostByUserId(String userId) async {
    List<Post> futurePosts = [];
    final Map<String, dynamic> requestData = {'id': userId};
    try {
      final response = await _dioClient.get(
        Endpoints.getPostbyUser + userId,
        data: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final responseData = response.data['posts'];
        futurePosts.addAll(
          (responseData as List).map(
            (post) => Post.fromJson(post),
          ),
        );
        print(response.data['posts']);
        return futurePosts;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  createPost(Map<String, dynamic> data) async {
    try {
      final response = await _dioClient.post(
        Endpoints.createPost,
        data: jsonEncode(data),
        options: Options(
          validateStatus: (status) {
            return status! >= 200 && status < 500;
          },
        ),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("Post created successfully");
        return true;
      } else {
        print("Failed to create post: ${response.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      print("Dio error: $e");
      return false;
    }
  }

  getCmt(int postId) async {
    List<Comment> comments = [];
    final Map<String, dynamic> data = {
      'post_id': postId,
    };
    try {
      print(data);
      final response = await _dioClient.get(
        Endpoints.getCmt,
        data: jsonEncode(data),
        options: Options(
          validateStatus: (status) {
            return status! >= 200 && status < 500;
          },
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData != null && responseData is List) {
          try {
            comments.addAll(
              (responseData).map(
                (comment) => Comment.fromJson(comment),
              ),
            );
          } catch (e) {
            print(e);
          }
        } else {
          print("Response data is not in the expected format or is null.");
          return [];
        }

        return comments.reversed.toList();
      } else {
        print("Failed to get comments: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Dio error: $e");
      return [];
    }
  }

  createComment(Map<String, dynamic> data) async {
    try {
      print("object");
      final response = await _dioClient.post(
        Endpoints.addCmt,
        data: jsonEncode(data),
        options: Options(
          validateStatus: (status) {
            return status! >= 200 && status < 500;
          },
        ),
      );
      print("object1");
      if (response.statusCode == 201 || response.statusCode == 200) {
        print("Comment created successfully");

        return true;
      } else {
        print("Failed to create comment: ${response.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      print("Dio error: $e");
      return false;
    }
  }
}
