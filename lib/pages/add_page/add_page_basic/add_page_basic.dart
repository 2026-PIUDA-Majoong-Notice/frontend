import 'dart:io';
import 'package:flutter/material.dart';

import 'widgets/profile_image_picker.dart';
import '../widgets/add_step_frame.dart';


class AddPageBasic extends StatelessWidget {
  final File? profileImage;
  final VoidCallback onProfileImageTap;

  const AddPageBasic({
    super.key,
    required this.profileImage,
    required this.onProfileImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AddStepFrame(
            title: '기본 정보',
            child: Column(
              children: [
                const SizedBox(height: 40),
                ProfileImagePicker(
                    imageFile: profileImage,
                    onTap: onProfileImageTap,
                ),


              ],
            ),
        ),
      ),
    );
  }
}
