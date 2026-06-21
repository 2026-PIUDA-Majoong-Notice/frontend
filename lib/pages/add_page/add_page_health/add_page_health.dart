import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../widgets/add_choice_pill.dart';
import '../widgets/add_step_frame.dart';


class AddPageHealth extends StatefulWidget {
  const AddPageHealth({super.key});

  @override
  State<AddPageHealth> createState() => _AddPageHealthState();
}

class _AddPageHealthState extends State<AddPageHealth> {
  String diaperUsage = '사용 안함';
  String bowelPattern = '없음';
  String mobilityStatus = '보조기구 필요';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AddStepFrame(
          title: '건강 정보',
          cancelText: '뒤로',
          onCancel: () {
            Get.back();
          },
          onNext: () {
            /// 다음 화면 이동
          },
          child: Column(
            children: [
              const SizedBox(height: 40),
              AddChoicePill<String>(
                label: '기저귀 사용 여부',
                options: const ['사용', '사용 안함'],
                selectedValue: diaperUsage,
                labelBuilder: (value) => value,
                onChanged: (value) {
                  setState(() {
                    diaperUsage = value;
                  });
                },
              ),
              AddChoicePill<String>(
                label: '대변 경향',
                options: const ['변비', '설사', '없음'],
                selectedValue: bowelPattern,
                labelBuilder: (value) => value,
                wrapOptions: true,
                onChanged: (value) {
                  setState(() {
                    bowelPattern = value;
                  });
                },
              ),
              AddChoicePill<String>(
                label: '거동 가능 여부',
                options: const ['독립 보행', '보조기구\n필요', '부축 필요', '거동불가/\n와상'],
                selectedValue: mobilityStatus,
                labelBuilder: (value) => value,
                wrapOptions: true,
                onChanged: (value) {
                  setState(() {
                    mobilityStatus = value;
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