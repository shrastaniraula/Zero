import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Cubit/Page_state/page_state_cubit.dart';
import 'package:zero/Global/colors.dart';
import 'package:zero/Model/post.dart';
import 'package:zero/Screen/Feed/post_detail_layout.dart';
import 'package:zero/Widgets/Feed/create_post_container.dart';
import 'package:zero/Widgets/Feed/post_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late PageStateCubit _pageStateCubit;

  @override
  void initState() {
    // Initialize PageStateCubit
    _pageStateCubit = PageStateCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _pageStateCubit,
      child: Column(
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
                Text(
                  "Welcome back, Hensal!",
                  style: GoogleFonts.roboto(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.1,
                  ),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppTheme.background),
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
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 4, bottom: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppTheme.background),
                  child: const Row(children: [
                    Text("Hensal Rai"),
                    Gap(8),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          NetworkImage("https://thispersondoesnotexist.com/"),
                    ),
                  ]),
                )
              ],
            ),
          ),
          Expanded(
            child: BlocListener<PageStateCubit, PageStateState>(
              listener: (context, state) {
                if (state is PageStatePostView) {
                  // Show post detail layout
                  _buildPostDetailLayout(state.selectedPost);
                }
              },
              child: BlocBuilder<PageStateCubit, PageStateState>(
                builder: (context, state) {
                  if (state is PageStateFeedView) {
                    // Display feed layout
                    return _buildFeedLayout();
                  } else if (state is PageStatePostView) {
                    // Display post detail layout
                    return _buildPostDetailLayout(state.selectedPost);
                  } else {
                    return _buildFeedLayout();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedLayout() {
    if (MediaQuery.of(context).size.width < 600) {
      // Small screen layout
      return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              width: double.infinity, // or provide a specific width value
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
            decoration: const BoxDecoration(),
            width: MediaQuery.of(context).size.width * 0.2,
          )
        ],
      );
    }
  }

  Widget _buildPostDetailLayout(selectedPost) {
    if (selectedPost == null) {
      // Handle the case where there's no selected post
      return SizedBox(); // or throw an error, depending on your logic
    }

    return PostDetailLayout(post: selectedPost);
  }
}

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
