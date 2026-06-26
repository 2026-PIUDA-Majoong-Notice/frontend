import 'package:flutter/material.dart';

import '../widgets/settings_app_bar.dart';
import '../widgets/settings_menu_tile.dart';


class SettingsAlarmPage extends StatelessWidget {
  const SettingsAlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF8FCFA),
      body: SafeArea(
        child: Column(
          children: [
            SettingsAppBar(title: '알림 설정'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                children: [
                  SettingsMenuTile(
                    title: '케어 타이밍 알림',
                  ),
                  SettingsMenuTile(
                    title: '기록 미입력 알림',
                  ),
                  SettingsMenuTile(
                    title: '야간 알림 제한',
                    showDivider: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}