import 'dart:io';
import 'package:flutter/material.dart';
import 'package:majoong_notice/pages/add_page/add_page_basic/widgets/add_form_text_field.dart';

import 'widgets/profile_image_picker.dart';
import '../widgets/add_step_frame.dart';


class AddPageBasic extends StatelessWidget {
  final File? profileImage;
  final VoidCallback onProfileImageTap;
  final ValueChanged<String> onNameChanged;

  const AddPageBasic({
    super.key,
    required this.profileImage,
    required this.onProfileImageTap,
    required this.onNameChanged,
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
                AddFormTextField(
                  label: '성함',
                  onChanged: onNameChanged,
                  suffix: const Text(
                    '어르신',
                    style: TextStyle(
                      fontFamily: 'SCDream',
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff26332F),
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
