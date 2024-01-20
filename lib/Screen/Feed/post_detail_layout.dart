import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Bloc/Feed/feed_bloc.dart';
import 'package:zero/Global/colors.dart';
import 'package:zero/Model/comment.dart';
import 'package:zero/Model/post.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:zero/Repository/Auth/auth_repository.dart';
import 'package:zero/Repository/Core/endpoints.dart';
import 'package:zero/Repository/Feed/feed_repository.dart';
import 'package:zero/Screen/Feed/comment_container.dart';

class PostDetailLayout extends StatefulWidget {
  final Post post;

  const PostDetailLayout({Key? key, required this.post}) : super(key: key);

  @override
  _PostDetailLayoutState createState() => _PostDetailLayoutState();
}

class _PostDetailLayoutState extends State<PostDetailLayout> {
  TextEditingController _commentController = TextEditingController();
  String formatTimeAgo(String dateTimeString) {
    final DateTime dateTime = DateTime.parse(dateTimeString);

    final timeAgo = timeago.format(dateTime, locale: 'en');

    return timeAgo;
  }

  late FeedBloc _feedBloc;
  FeedRepository _feedRepository = FeedRepository();
  AuthRepository authRepository = AuthRepository();
  List<Comment> comments = [];
  Color getRandomLightColor() {
    final random = Random();
    final r = 200 + random.nextInt(100); // Random red component (200-255)
    final g = 100 + random.nextInt(100); // Random green component (200-255)
    final b = 200 + random.nextInt(100); // Random blue component (200-255)
    return Color.fromARGB(255, r, g, b); // Create a random color
  }

  createComment(String commentDesc) async {
    int postId = widget.post.id!;
    Map<String, dynamic> commentData = {
      'comment_desc': commentDesc,
      'post_id': postId,
      'user_email': authUser?.email ?? '',
      // Add other necessary fields
    };
    print(commentData);
    return _feedRepository.createComment(commentData);
  }

  AuthUser? authUser;

  @override
  void initState() {
    _feedBloc = FeedBloc(FeedRepository());
    _feedBloc.add(GetCmtOfPost(postId: widget.post.id!));
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    AuthUser? user = await authRepository.getAuthUser();
    setState(() {
      authUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    Uri imageUrl =
        Uri.parse('${Endpoints.apiVersion}/${widget.post.image.toString()}');
    String formattedUrl = imageUrl.toString().replaceAll(r'\', '/');

    return BlocProvider(
      create: (context) => _feedBloc,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.6,
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Add more widgets to display post details using 'widget.post' data
              Container(
                margin: const EdgeInsets.all(8),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: getRandomLightColor().withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              widget.post.postBy.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.post.description.toString(),
                              style: GoogleFonts.roboto(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.1,
                                color: AppTheme.grey.withOpacity(0.5),
                              ),
                            ),
                            if (widget.post.image.toString().isNotEmpty)
                              SizedBox(
                                width: double.maxFinite,
                                child: Image.network(
                                  //    formattedUrl,
                                  "https://source.unsplash.com/random/900×700/?fruit",
                                  fit: BoxFit.fitWidth,
                                  errorBuilder: (context, error, stackTrace) {
                                    return SizedBox();
                                  },
                                ),
                              ),
                            const Text("Tags"),
                          ]),
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border_rounded,
                            color: const Color.fromARGB(255, 96, 106, 114)
                                .withOpacity(0.5),
                          ),
                          const Gap(4),
                          Text(
                            widget.post.upVote_count.toString(),
                            style: GoogleFonts.roboto(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.1,
                              color: AppTheme.grey.withOpacity(0.5),
                            ),
                          ),
                          const Gap(16),
                          const Expanded(child: SizedBox()),
                          Icon(
                            Icons.calendar_month,
                            color: const Color.fromARGB(255, 96, 106, 114)
                                .withOpacity(0.5),
                          ),
                          Text(
                            // formatTimeAgo("s"),
                            "9",
                            style: GoogleFonts.roboto(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.1,
                              color: AppTheme.grey.withOpacity(0.5),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Answers",
                    style: GoogleFonts.roboto(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              BlocBuilder<FeedBloc, FeedState>(
                builder: (context, state) {
                  if (state is CmtLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CmtLoaded) {
                    comments = state.cmts;
                    return Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          return CommentContainer(
                            comment: comments[index],
                          );
                        },
                      ),
                    );
                  } else if (state is CmtError) {
                    return Container(
                      child: Text("No cmts"),
                    );
                  } else {
                    return Container(
                      child: Text("Nope"),
                    );
                  }
                },
              ),

              Row(
                children: [
                  Text(
                    "Your Answer",
                    style: GoogleFonts.roboto(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Gap(8),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: 5,
                      controller: _commentController,
                      decoration: const InputDecoration(
                        hintText: 'Write your answer...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        hintStyle: TextStyle(color: Colors.grey),
                        counterText: '',
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      margin: const EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: InkWell(
                        onTap: () async {
                          // Get the entered comment description
                          String commentDesc = _commentController.text;

                          // Create a comment using the repository
                          bool commentCreated =
                              await createComment(commentDesc);

                          if (commentCreated) {
                            // Comment created successfully, you can update UI or show a message
                            print('Comment created successfully');
                          } else {
                            // Failed to create comment, handle accordingly
                            print('Failed to create comment');
                          }
                        },
                        child: Center(
                          child: Text(
                            'Post',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
