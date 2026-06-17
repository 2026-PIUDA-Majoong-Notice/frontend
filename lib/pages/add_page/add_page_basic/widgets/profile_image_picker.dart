import 'dart:io';
import 'package:flutter/material.dart';


class ProfileImagePicker extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onTap;

  const ProfileImagePicker({
    super.key,
    required this.imageFile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 144,
            height: 144,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0x3326332F),
                width: 1,
              ),
              image: imageFile == null
                  ? null
                  : DecorationImage(
                image: FileImage(imageFile!),
                fit: BoxFit.cover,
              ),
            ),
            child: imageFile == null
                ? const Icon(
              Icons.camera_alt,
              size: 34,
              color: Color(0x3326332F),
            )
                : null,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          '프로필 사진',
          style: TextStyle(
            fontFamily: 'SCDream',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xff26332F),
          ),
        ),
        const SizedBox(height: 3),
        const Text(
          '사진을 등록하면 어르신을 더 쉽게 알아볼 수 있어요',
          style: TextStyle(
            fontFamily: 'SCDream',
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Color(0xff26332F),
          ),
        ),
      ],
    );
  }
}