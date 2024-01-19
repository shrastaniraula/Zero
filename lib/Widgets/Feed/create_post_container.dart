import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zero/Global/colors.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
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
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage:
                NetworkImage("https://thispersondoesnotexist.com/"),
          ),
          const Gap(8),
          Container(
            width: 200,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 225, 225, 225),
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Whats on your mind?',
              ),
            ),
          ),
          const Gap(8),
          Container(
              color: Colors.black,
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Create Post",
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }
}
