import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Global/colors.dart';
import 'package:zero/Model/post.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:zero/Repository/Core/endpoints.dart';

class PostDetailLayout extends StatefulWidget {
  final Post post;

  const PostDetailLayout({Key? key, required this.post}) : super(key: key);

  @override
  _PostDetailLayoutState createState() => _PostDetailLayoutState();
}

class _PostDetailLayoutState extends State<PostDetailLayout> {
  String formatTimeAgo(String dateTimeString) {
    final DateTime dateTime = DateTime.parse(dateTimeString);

    final timeAgo = timeago.format(dateTime, locale: 'en');

    return timeAgo;
  }

  @override
  Widget build(BuildContext context) {
    Uri imageUrl =
        Uri.parse('${Endpoints.apiVersion}/${widget.post.image.toString()}');
    String formattedUrl = imageUrl.toString().replaceAll(r'\', '/');
    return Container(
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
                          if (widget.post.image.toString().isNotEmpty)
                            SizedBox(
                              width: double.maxFinite,
                              child: Image.network(
                                formattedUrl,
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
            Container(
              padding: const EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 8, bottom: 8),
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
              child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [CircleAvatar(), Gap(4), Text("Shrasta")],
                    ),
                    Gap(4),
                    Text(
                        "Answer i know this  has to be the issuse of any people having the issue so keep it up haha lol hahah lol"),
                  ]),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
