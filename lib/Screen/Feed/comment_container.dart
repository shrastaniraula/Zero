import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zero/Global/colors.dart';
import 'package:zero/Model/comment.dart';

class CommentContainer extends StatelessWidget {
  final Comment comment;
  const CommentContainer({super.key, required this.comment});
  Color getRandomLightColor() {
    final random = Random();
    final r = 200 + random.nextInt(100); // Random red component (200-255)
    final g = 100 + random.nextInt(100); // Random green component (200-255)
    final b = 200 + random.nextInt(100); // Random blue component (200-255)
    return Color.fromARGB(255, r, g, b); // Create a random color
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: getRandomLightColor().withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
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
