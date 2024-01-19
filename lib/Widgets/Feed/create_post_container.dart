import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage("https://thispersondoesnotexist.com/"),
        ),
        const Gap(8),
        Container(
          width: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
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
    );
  }
}
