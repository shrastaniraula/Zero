import 'package:flutter/material.dart';
import 'package:zero/Model/post.dart';
import '../../Repository/Feed/feed_repository.dart';

class SideBox extends StatefulWidget {
  const SideBox({Key? key}) : super(key: key);

  @override
  State<SideBox> createState() => _SideBoxState();
}

class _SideBoxState extends State<SideBox> {
  final FeedRepository _feedRepository = FeedRepository();
  late List<Post> recentPosts;

  @override
  void initState() {
    super.initState();
    fetchRecentPosts();
  }

  Future<void> fetchRecentPosts() async {
    try {
      List<Post> posts = await _feedRepository.get10Posts();
      setState(() {
        recentPosts = posts;
      });
    } catch (error) {
      print('Error fetching recent posts: $error');
      // Handle the error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    if (recentPosts == null) {
      // Loading state while fetching data
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (recentPosts.isEmpty) {
      // Empty data state
      return Center(
        child: Text('No recent posts available.'),
      );
    } else {
      // Display descriptions of recent posts
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber[100],
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.amber, width: 1.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.amber,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Text(
                  "Recent posts",
                  style: TextStyle(fontSize: 18.0, color: Colors.amber),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: recentPosts.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      recentPosts[index].description!,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}
