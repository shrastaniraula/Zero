import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Global/colors.dart';

class PostEngement extends StatefulWidget {
  const PostEngement({super.key});

  @override
  State<PostEngement> createState() => _PostEngementState();
}

class _PostEngementState extends State<PostEngement> {
  final Random random = Random();

  late int likesCount;
  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    // Initialize likesCount with a random number between 0 and 100
    likesCount = random.nextInt(101);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Toggle the favorite status and update the likes count
              setState(() {
                isFavorited = !isFavorited;
                likesCount = isFavorited ? likesCount + 1 : likesCount - 1;
              });
            },
            child: Icon(
              isFavorited
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: isFavorited
                  ? Colors.red
                  : const Color.fromARGB(255, 96, 106, 114).withOpacity(0.5),
            ),
          ),
          const Gap(4),
          Text(
            likesCount.toString(),
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
            color: const Color.fromARGB(255, 96, 106, 114).withOpacity(0.5),
          ),
          const Gap(4),
          Text(
            "0", // You can replace this with the actual comments count logic
            style: GoogleFonts.roboto(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.1,
              color: AppTheme.grey.withOpacity(0.5),
            ),
          ),
          const Expanded(child: SizedBox()),
          Icon(
            Icons.calendar_month,
            color: const Color.fromARGB(255, 96, 106, 114).withOpacity(0.5),
          ),
          Text(
            "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}",
            style: GoogleFonts.roboto(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.1,
              color: AppTheme.grey.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
