import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Global/colors.dart';
import 'package:zero/Repository/Auth/auth_repository.dart';

import 'package:zero/Widgets/Feed/create_post.dart';

class CreatePostHeader extends StatefulWidget {
  const CreatePostHeader({Key? key}) : super(key: key);

  @override
  State<CreatePostHeader> createState() => _CreatePostHeaderState();
}

class _CreatePostHeaderState extends State<CreatePostHeader> {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
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
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage:
                NetworkImage("https://thispersondoesnotexist.com/"),
          ),
          const Gap(8),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    child: AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text(
                        'Create Post',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      content: CreatePost(),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromARGB(255, 225, 225, 225),
              ),
              margin: const EdgeInsets.all(10),
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 4),
              child: const Text(
                'What\'s on your code?',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
