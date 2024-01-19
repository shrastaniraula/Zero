import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Widgets/Feed/create_post_container.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Small screen layout
          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                CreatePostContainer(),
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
                      CreatePostContainer(),
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
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.2,
              )
            ],
          );
        }
      },
    );
  }
}
