import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Cubit/Page_state/page_state_cubit.dart';
import 'package:zero/Global/colors.dart';
import 'package:zero/Model/post.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:zero/Screen/Feed/feed_page.dart';

class PostContainer extends StatefulWidget {
  final Post post;
  const PostContainer({super.key, required this.post});

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  String formatTimeAgo(String dateTimeString) {
    final DateTime dateTime = DateTime.parse(dateTimeString);

    final timeAgo = timeago.format(dateTime, locale: 'en');

    return timeAgo;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
        BlocProvider.of<PageStateCubit>(context)
            .emit(PageStatePostView(selectedPost: widget.post));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: const Offset(1, 1),
                blurRadius: 5.0),
          ],
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
                    if (widget.post.description.toString().isNotEmpty)
                      SizedBox(
                        width: double.maxFinite,
                        child: Image.network(
                          widget.post.image.toString(),
                          fit: BoxFit.fitWidth,
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
                  Icon(
                    Icons.comment_outlined,
                    color: const Color.fromARGB(255, 96, 106, 114)
                        .withOpacity(0.5),
                  ),
                  const Gap(4),
                  // Text(
                  //   post.commentsCount.toString(),
                  //   style: GoogleFonts.roboto(
                  //     fontSize: 16.0,
                  //     fontWeight: FontWeight.w400,
                  //     letterSpacing: -0.1,
                  //     color: AppTheme.grey.withOpacity(0.5),
                  //   ),
                  // ),
                  const Expanded(child: SizedBox()),
                  Icon(
                    Icons.calendar_month,
                    color: const Color.fromARGB(255, 96, 106, 114)
                        .withOpacity(0.5),
                  ),
                  Text(
                    formatTimeAgo(widget.post.updatedAt.toString()),
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
    );
  }
}
