import 'dart:io';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Global/colors.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  File? _selectedImage;

  Future<void> _pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        print("object");
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 400,
      child: Column(children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage:
                  NetworkImage("https://thispersondoesnotexist.com/"),
            ),
            Gap(4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hensal rai",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text("Tag"),
              ],
            ),
          ],
        ),
        Gap(8),
        Container(
          height: 250,
          child: ListView(shrinkWrap: true, children: [
            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Write a caption...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
                hintStyle: TextStyle(color: Colors.grey),
                counterText: '',
              ),
            ),
            if (_selectedImage != null)
              Image.file(
                _selectedImage!,
                fit: BoxFit.cover,
              ),
          ]),
        ),
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppTheme.grey.withOpacity(0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add  Image',
                  style: GoogleFonts.roboto(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  Icons.image_outlined,
                  color: Colors.green,
                )
              ],
            ),
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
      ]),
    );
  }
}
