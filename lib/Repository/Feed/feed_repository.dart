import 'dart:convert';

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
      print(response.statusCode);
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
    } catch (e) {}
  }
}
