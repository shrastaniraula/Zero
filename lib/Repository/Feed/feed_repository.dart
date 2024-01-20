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
        return futurePosts;
      } else {
        // Handle error based on response status code
        return false;
      }
    } on DioError catch (e) {
      // Handle Dio errors here (e.g., network error, timeout, etc.)
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
        // Handle error based on response status code
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
            return status! >= 200 &&
                status < 500; // Adjust based on your server's behavior
          },
        ),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Successful post creation
        print("Post created successfully");
        // You might want to return some response data or a success indicator
        return true;
      } else {
        // Handle error based on response status code
        print("Failed to create post: ${response.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      // Handle Dio errors here (e.g., network error, timeout, etc.)
      print("Dio error: $e");
      return false;
    }
  }

  getCmt(int postId) async {
    List<Comment> comments = [];
    final Map<String, dynamic> data = {
      'post_id': postId,
      // Set the user's email
    };
    try {
      print(data);
      final response = await _dioClient.get(
        Endpoints.getCmt,
        // queryParameters: {
        //   'post_id': postId,
        // },
        data: jsonEncode(data),
        options: Options(
          validateStatus: (status) {
            return status! >= 200 &&
                status < 500; // Adjust based on your server's behavior
          },
        ),
      );
      print("Ara");
      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData != null && responseData is List) {
          try {
            comments.addAll(
              (responseData as List).map(
                (comment) => Comment.fromJson(comment),
              ),
            );
          } catch (e) {
            print(e);
          }
        } else {
          print("Response data is not in the expected format or is null.");
          return []; // Return an empty list if the data is not in the expected format or is null
        }

        return comments;
      } else {
        // Handle error based on response status code
        print("Failed to get comments: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      // Handle Dio errors here (e.g., network error, timeout, etc.)
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
            return status! >= 200 &&
                status < 500; // Adjust based on your server's behavior
          },
        ),
      );
      print("object1");
      if (response.statusCode == 201 || response.statusCode == 200) {
        // Successful comment creation
        print("Comment created successfully");
        // You might want to return some response data or a success indicator
        return true;
      } else {
        // Handle error based on response status code
        print("Failed to create comment: ${response.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      // Handle Dio errors here (e.g., network error, timeout, etc.)
      print("Dio error: $e");
      return false;
    }
  }
}
