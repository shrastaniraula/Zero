import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Global/colors.dart';
import 'package:zero/Model/comment.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentContainer extends StatelessWidget {
  final Comment comment;
  const CommentContainer({super.key, required this.comment});

  Color getRandomLightColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  String formatTimeAgo(String dateTimeString) {
    final DateTime dateTime = DateTime.parse(dateTimeString);

    final timeAgo = timeago.format(dateTime, locale: 'en');

    return timeAgo;
  }

  @override
  Widget build(BuildContext context) {
    Color color = getRandomLightColor();
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://source.unsplash.com/random/900x700/?fruit")),
              const Gap(4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.userName,
                    style: GoogleFonts.roboto(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    formatTimeAgo(comment.commentDate),
                    style: GoogleFonts.roboto(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.1,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(4),
          Text(
            comment.commentDesc,
            style: GoogleFonts.acme(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.1,
              color: AppTheme.darkText,
            ),
          ),
        ],
      ),
    );
  }
}
