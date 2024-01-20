import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zero/Model/comment.dart';

class CommentContainer extends StatelessWidget {
  final Comment comment;
  const CommentContainer({super.key, required this.comment});

  Color getRandomLightColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
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
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CircleAvatar(),
              Gap(4),
              // Uncomment the line below if Comment model has a 'userName' field
              // Text(comment.userName),
            ],
          ),
          const Gap(4),
          Text(comment.commentDesc),
        ],
      ),
    );
  }
}
