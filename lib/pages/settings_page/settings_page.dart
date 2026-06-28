import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/bottom_navi_bar.dart';
import 'model/settings_menu_item.dart';
import 'settings_alarm_page/settings_alarm_page.dart';
import 'settings_display_page/settings_display_page.dart';
import 'settings_info_page/settings_info_page.dart';
import 'widgets/settings_menu_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  List<SettingsMenuItem> get _menuItems {
    return [
      SettingsMenuItem(
        title: '내 정보',
        onTap: () {
          Get.to(() => const SettingsInfoPage());
        },
      ),
      SettingsMenuItem(
        title: '알림 설정',
        onTap: () {
          Get.to(() => const SettingsAlarmPage());
        },
      ),
      const SettingsMenuItem(
        title: '기록 설정',
      ),
      SettingsMenuItem(
        title: '화면 설정',
        onTap: () {
          Get.to(() => const SettingsDisplayPage());
        },
      ),
      const SettingsMenuItem(
        title: '데이터 안전관리',
      ),
      const SettingsMenuItem(
        title: '고객지원',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6FAF8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 35, top: 40),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _menuItems.length,
                  itemBuilder: (context, index) {
                    final item = _menuItems[index];

                    return SettingsMenuTile(
                      title: item.title,
                      onTap: item.onTap,
                      showDivider: index != _menuItems.length - 1,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(currentIndex: 2),
    );
  }
}