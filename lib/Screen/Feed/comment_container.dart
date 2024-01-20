import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zero/Global/colors.dart';
import 'package:zero/Model/comment.dart';

class CommentContainer extends StatelessWidget {
  final Comment comment;
  const CommentContainer({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppTheme.grey.withOpacity(0.2),
            offset: const Offset(1, 1),
            blurRadius: 5.0,
          ),
        ],
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
