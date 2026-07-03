import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../record_page_add/record_page_add.dart';
import 'widgets/add_record_card_button.dart';
import 'widgets/record_type_icon.dart';
import '../../../components/bottom_navi_bar.dart';
import 'widgets/life_record_card.dart';
import 'widgets/toilet_record_card.dart';


class RecordPageMain extends StatefulWidget {
  const RecordPageMain({super.key});

  @override
  State<RecordPageMain> createState() => _RecordPageMainState();
}

class _RecordPageMainState extends State<RecordPageMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            AddRecordCardButton(
              onTap: () {
                Get.to(() => const RecordPageAdd());
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
              child: Text(
                '용변 기록',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SCDream',
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RecordTypeIcon(
                  icon: Icons.wc,
                  label: '대변',
                ),
                SizedBox(width: 120),
                RecordTypeIcon(
                  icon: Icons.wc,
                  label: '소변',
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToiletRecordCard(text: '1시간 전 용변'),
                SizedBox(width: 20),
                ToiletRecordCard(text: '1시간 전 용변'),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
              child: Text(
                '생활 기록',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SCDream',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, bottom: 5),
              child: Row(
                children: [
                  RecordTypeIcon(
                    icon: Icons.water_drop,
                    label: '수분',
                  ),
                  SizedBox(width: 30),
                  LifeRecordCard(leftText: '1시간 전 섭취', rightText: '한 컵')
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, bottom: 5),
              child: Row(
                children: [
                  RecordTypeIcon(
                    icon: Icons.fastfood,
                    label: '식사',
                  ),
                  SizedBox(width: 30),
                  LifeRecordCard(leftText: '1시간 전 섭취', rightText: '한 공기')
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, bottom: 5),
              child: Row(
                children: [
                  RecordTypeIcon(
                    icon: Icons.bed,
                    label: '수면',
                  ),
                  SizedBox(width: 30),
                  LifeRecordCard(leftText: '21시 취침', rightText: '10시 기상')
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, bottom: 5),
              child: Row(
                children: [
                  RecordTypeIcon(
                    icon: Icons.medication,
                    label: '약',
                  ),
                  SizedBox(width: 30),
                  LifeRecordCard(leftText: '항생제 섭취', rightText: '아침')
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(currentIndex: 1),
    );
  }
}
