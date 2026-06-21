import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../add_page_medicine/add_page_medicine.dart';
import 'widgets/cognition_status_option.dart';
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
  String cognitionStatus = '부분 가능';

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
            Get.to(() => const AddPageMedicine());
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
              /// 인지 상태
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 24),
                    child: Text(
                      '인지 상태',
                      style: TextStyle(
                        fontFamily: 'SCDream',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff26332F),
                      ),
                    ),
                  ),
                  CognitionStatusOption(
                    title: '명확함\n(정상)',
                    subtitle: '용변 의사를 스스로 명확히 인지하고\n표현할 수 있음',
                    isSelected: cognitionStatus == '명확함',
                    onTap: () {
                      setState(() {
                        cognitionStatus = '명확함';
                      });
                    },
                  ),
                  const SizedBox(height: 18),
                  CognitionStatusOption(
                    title: '부분 가능\n(경도 저하)',
                    subtitle: '가끔 인지하지 못하거나 표현이 늦어\n실수가 발생함',
                    isSelected: cognitionStatus == '부분 가능',
                    onTap: () {
                      setState(() {
                        cognitionStatus = '부분 가능';
                      });
                    },
                  ),
                  const SizedBox(height: 18),
                  CognitionStatusOption(
                    title: '표현 불가\n(중증 저하)',
                    subtitle: '배변 의사를 스스로 인지하거나\n표현하기 어려움',
                    isSelected: cognitionStatus == '표현 불가',
                    onTap: () {
                      setState(() {
                        cognitionStatus = '표현 불가';
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}