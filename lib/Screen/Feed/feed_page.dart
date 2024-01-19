import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Global/colors.dart';
import 'package:zero/Model/post.dart';
import 'package:zero/Widgets/Feed/create_post_container.dart';
import 'package:zero/Widgets/Feed/post_container.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Post> dummyPosts = [
    Post(
      id: "1",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      image: "https://source.unsplash.com/random/900×700/?programming",
      upVote_count: 20,
      downVote_count: 5,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      postBy: 'Hensal',
    ),
    Post(
      id: "2",
      description:
          "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      image: "https://source.unsplash.com/random/900×700/?code",
      upVote_count: 15,
      downVote_count: 3,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      postBy: 'Hensal',
    ),
    Post(
      id: "3",
      description:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.",
      image: "https://source.unsplash.com/random/900×700/?fruit",
      upVote_count: 25,
      downVote_count: 8,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      postBy: 'Hensal',
    ),
    Post(
      id: "4",
      description:
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.",
      image: "https://source.unsplash.com/random/900×700/?java",
      upVote_count: 18,
      downVote_count: 4,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      postBy: 'Hensal',
    ),
    Post(
      id: "5",
      description:
          "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      image: "https://source.unsplash.com/random/900×700/?flower",
      upVote_count: 30,
      downVote_count: 10,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      postBy: 'Hensal Rai',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: AppTheme.grey.withOpacity(0.2),
                  offset: const Offset(1, 1),
                  blurRadius: 5.0),
            ],
          ),
          child: Row(
            children: [
              Text("Welcome back, Hensal!"),
              Expanded(child: SizedBox()),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search_sharp),
                      onPressed: () {},
                    ),
                    // suffixIcon: SizedBox(
                    //   width: 24, // Set the desired width
                    //   height: 24, // Set the desired height
                    //   child: Image.asset("assets/img/search_logo.png"),
                    // ),
                  ),
                ),
              ),
              Container(
                child: Row(children: [Text("Hensal Rai"), CircleAvatar()]),
              )
            ],
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                // Small screen layout
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        width: double
                            .infinity, // or provide a specific width value
                        child: const CreatePostHeader(),
                      ),
                      Row(
                        children: [
                          Text(
                            "Feed",
                            style: GoogleFonts.roboto(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.1,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: dummyPosts.length,
                          itemBuilder: (context, index) {
                            return PostContainer(post: dummyPosts[index]);
                          },
                        ),
                      )
                    ],
                  ),
                );
              } else {
                // Large screen layout
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            const CreatePostHeader(),
                            Row(
                              children: [
                                Text(
                                  "Feed",
                                  style: GoogleFonts.roboto(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: dummyPosts.length,
                                itemBuilder: (context, index) {
                                  return PostContainer(post: dummyPosts[index]);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      width: MediaQuery.of(context).size.width * 0.2,
                    )
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
