import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Model/post.dart';
import '../../Repository/Feed/feed_repository.dart';

class SideBox extends StatefulWidget {
  const SideBox({Key? key}) : super(key: key);

  @override
  State<SideBox> createState() => _SideBoxState();
}

class _SideBoxState extends State<SideBox> {
  final FeedRepository _feedRepository = FeedRepository();
  List<Post> recentPosts = [];
  Color getRandomLightColor() {
    final random = Random();
    final r = 200 + random.nextInt(100); // Random red component (200-255)
    final g = 100 + random.nextInt(100); // Random green component (200-255)
    final b = 200 + random.nextInt(100); // Random blue component (200-255)
    return Color.fromARGB(255, r, g, b); // Create a random color
  }

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
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (recentPosts.isEmpty) {
      // Empty data state
      return const Center(
        child: Text('No recent posts available.'),
      );
    } else {
      // Display descriptions of recent posts
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Text("Recent",
                    style: GoogleFonts.aBeeZee(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600)),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: recentPosts.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Container(
                          ///depend on font Size
                          height: 16,
                          width: 2,
                          color: getRandomLightColor(),
                          margin: const EdgeInsets.only(right: 5),

                          /// <= margin  text container
                        ),
                        const Gap(2),
                        Text(
                          recentPosts[index].tag ?? 'Computing',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
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
