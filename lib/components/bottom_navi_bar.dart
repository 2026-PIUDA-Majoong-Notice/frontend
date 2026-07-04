import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:majoong_notice/pages/home_page/widgets/home_page.dart';

import '../pages/record_page/record_page_main/record_page_main.dart';
import '../pages/settings_page/settings_page.dart';


class BottomNaviBar extends StatelessWidget {
  final int currentIndex;

  const BottomNaviBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) return;

          if (index == 0) {
            Get.off(() => const HomePage());/// TODO: 홈 페이지 만들면 연결
            return;
          }
          if (index == 1) {
            Get.off(() => const RecordPageMain());
            return;
          }
          if (index == 2) {
            Get.off(() => const SettingsPage());
            return;
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff_F6_FA_F8),
        selectedItemColor: const Color(0xff6FAF9B),
        unselectedItemColor: const Color(0xff26332F),
        selectedLabelStyle: const TextStyle(
          fontFamily: 'SCDream',
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'SCDream',
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '기록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
      ),
    );
  }
}
