import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'widgets/add_form_text_field.dart';
import '../../../widgets/add_time_field.dart';
import 'widgets/profile_image_picker.dart';
import '../../../widgets/add_choice_pill.dart';
import '../../../widgets/add_step_frame.dart';
import '../add_page_health/add_page_health.dart';
import '../../../services/http/image/upload_image.dart';


class AddPageBasic extends StatefulWidget {
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
  State<AddPageBasic> createState() => _AddPageBasicState();
}

class _AddPageBasicState extends State<AddPageBasic> {
  String selectedGender = '여성';
  TimeOfDay? wakeUpTime;
  TimeOfDay? sleepTime;

  bool isUploadingImage = false;
  int? profileImageId;

  Future<void> _goNext() async {
    try {
      setState(() {
        isUploadingImage = true;
      });

      if (widget.profileImage != null) {
        profileImageId = await uploadImage(
          imagePath: widget.profileImage!.path,
        );
      }

      Get.to(() => AddPageHealth(
        profileImageId: profileImageId,
        imageId: 0,
        name: '',
        birth: '',
        gender: '',
        wakeTime: '',
        sleepTime: '',
      ));
    } catch (e) {
      Get.snackbar(
          '이미지 업로드 실패',
          '사진 업로드에 실패했어요. 다시 시도해주세요.'
      );
    } finally {
      if (!mounted) return;

      setState(() {
        isUploadingImage = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AddStepFrame(
            title: '기본 정보',
          onCancel: () {
            Get.back();
          },
          onNext: _goNext,
            child: Column(
              children: [
                const SizedBox(height: 40),
                ProfileImagePicker(
                    imageFile: widget.profileImage,
                    onTap: widget.onProfileImageTap,
                ),
                const SizedBox(height: 30),
                AddFormTextField(
                  label: '성함',
                  onChanged: widget.onNameChanged,
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
                AddChoicePill<String>(
                  label: '성별',
                  options: const ['남성', '여성'],
                  selectedValue: selectedGender,
                  labelBuilder: (value) => value,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                AddFormTextField(
                  label: '생년월일',
                  onChanged: widget.onNameChanged,
                  hintText: '예시) 19611009',
                ),
                AddTimeField(
                  label: '기상시간',
                  value: wakeUpTime,
                  onChanged: (value) {
                    setState(() {
                      wakeUpTime = value;
                    });
                  },
                ),
                AddTimeField(
                  label: '취침시간',
                  value: sleepTime,
                  onChanged: (value) {
                    setState(() {
                      sleepTime = value;
                    });
                  },
                ),
              ],
            ),
        ),
      ),
    );
  }
}
