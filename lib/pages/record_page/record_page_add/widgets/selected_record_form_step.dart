import 'package:flutter/material.dart';

import '../../../../widgets/add_choice_pill.dart';
import '../../../../widgets/add_time_field.dart';
import '../model/record_add_type.dart';
import 'record_section.dart';

class SelectedRecordFormStep extends StatefulWidget {
  final Set<RecordAddType> selectedTypes;

  const SelectedRecordFormStep({
    super.key,
    required this.selectedTypes,
  });

  @override
  State<SelectedRecordFormStep> createState() => _SelectedRecordFormStepState();
}

class _SelectedRecordFormStepState extends State<SelectedRecordFormStep> {
  TimeOfDay? wakeUpTime;
  TimeOfDay? sleepTime;
  TimeOfDay? stoolTime;
  TimeOfDay? urineTime;
  TimeOfDay? mealTime;
  TimeOfDay? waterTime;

  String mealAmount = '한 공기 이상';
  String waterAmount = '한 컵 이상';

  String breakfastMeal = '미섭취';
  String lunchMeal = '미섭취';
  String dinnerMeal = '미섭취';

  String breakfastMedicine = '미복용';
  String dinnerMedicine = '미복용';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          if (widget.selectedTypes.contains(RecordAddType.toilet))
            RecordSection(
              title: '용변',
              child: Column(
                children: [
                  AddTimeField(
                    label: '대변 발생 시간',
                    value: stoolTime,
                    onChanged: (value) {
                      setState(() {
                        stoolTime = value;
                      });
                    },
                  ),
                  AddTimeField(
                    label: '소변 발생 시간',
                    value: urineTime,
                    onChanged: (value) {
                      setState(() {
                        urineTime = value;
                      });
                    },
                  ),
                ],
              ),
            ),

          if (widget.selectedTypes.contains(RecordAddType.water))
            RecordSection(
              title: '수분',
              child: Column(
                children: [
                  AddTimeField(
                    label: '수분 섭취 시간',
                    value: waterTime,
                    onChanged: (value) {
                      setState(() {
                        waterTime = value;
                      });
                    },
                  ),
                  AddChoicePill<String>(
                    label: '수분\n섭취량',
                    wrapOptions: true,
                    options: const ['반 컵', '한 컵', '한 컵 이상'],
                    selectedValue: waterAmount,
                    labelBuilder: (value) => value,
                    onChanged: (value) {
                      setState(() {
                        waterAmount = value;
                      });
                    },
                  ),
                ],
              ),
            ),

          if (widget.selectedTypes.contains(RecordAddType.meal))
            RecordSection(
              title: '식사',
              child: Column(
                children: [
                  AddTimeField(
                    label: '식사시간',
                    value: mealTime,
                    onChanged: (value) {
                      setState(() {
                        mealTime = value;
                      });
                    },
                  ),
                  AddChoicePill<String>(
                    label: '식사량',
                    wrapOptions: true,
                    options: const ['반 공기', '한 공기', '한 공기 이상'],
                    selectedValue: mealAmount,
                    labelBuilder: (value) => value,
                    onChanged: (value) {
                      setState(() {
                        mealAmount = value;
                      });
                    },
                  ),
                ],
              ),
            ),

          if (widget.selectedTypes.contains(RecordAddType.sleep))
            RecordSection(
              title: '수면',
              child: Column(
                children: [
                  AddTimeField(
                    label: '취침 시간',
                    value: sleepTime,
                    onChanged: (value) {
                      setState(() {
                        sleepTime = value;
                      });
                    },
                  ),
                  AddTimeField(
                    label: '기상 시간',
                    value: wakeUpTime,
                    onChanged: (value) {
                      setState(() {
                        wakeUpTime = value;
                      });
                    },
                  ),
                ],
              ),
            ),

          if (widget.selectedTypes.contains(RecordAddType.medicine))
            RecordSection(
              title: '약',
              child: Column(
                children: [
                  AddChoicePill<String>(
                    label: '아침',
                    options: const ['복용', '미복용'],
                    selectedValue: breakfastMedicine,
                    labelBuilder: (value) => value,
                    onChanged: (value) {
                      setState(() {
                        breakfastMedicine = value;
                      });
                    },
                  ),
                  AddChoicePill<String>(
                    label: '저녁',
                    options: const ['복용', '미복용'],
                    selectedValue: dinnerMedicine,
                    labelBuilder: (value) => value,
                    onChanged: (value) {
                      setState(() {
                        dinnerMedicine = value;
                      });
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}