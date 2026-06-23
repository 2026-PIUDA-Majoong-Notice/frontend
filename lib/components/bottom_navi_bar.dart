import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../pages/record_page/record_page_main/record_page_main.dart';


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

          if (index == 1) {
            Get.off(() => const RecordPageMain());
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
