import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/add_step_frame.dart';
import 'model/record_add_type.dart';
import 'widgets/record_type_select_step.dart';
import 'widgets/selected_record_form_step.dart';

class RecordPageAdd extends StatefulWidget {
  const RecordPageAdd({super.key});

  @override
  State<RecordPageAdd> createState() => _RecordPageAddState();
}

class _RecordPageAddState extends State<RecordPageAdd> {
  bool isSelectingRecordType = true;

  final Set<RecordAddType> selectedTypes = {};

  void toggleType(RecordAddType type) {
    setState(() {
      if (selectedTypes.contains(type)) {
        selectedTypes.remove(type);
      } else {
        selectedTypes.add(type);
      }
    });
  }

  void handleCancel() {
    if (isSelectingRecordType) {
      Get.back();
      return;
    }

    setState(() {
      isSelectingRecordType = true;
    });
  }

  void handleNext() {
    if (isSelectingRecordType) {
      if (selectedTypes.isEmpty) return;

      setState(() {
        isSelectingRecordType = false;
      });
      return;
    }

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AddStepFrame(
          title: isSelectingRecordType ? '어떤 항목을 기록하고 싶으신가요?' : '',
          cancelText: '뒤로',
          nextText: isSelectingRecordType ? '다음' : '완료',
          onCancel: handleCancel,
          onNext: handleNext,
          child: isSelectingRecordType
              ? RecordTypeSelectStep(
            selectedTypes: selectedTypes,
            onTypeTap: toggleType,
          )
              : SelectedRecordFormStep(
            selectedTypes: selectedTypes,
          ),
        ),
      ),
    );
  }
}