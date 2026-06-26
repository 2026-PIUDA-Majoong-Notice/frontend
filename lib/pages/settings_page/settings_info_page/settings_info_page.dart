import 'package:flutter/material.dart';

import '../widgets/settings_app_bar.dart';
import '../widgets/settings_menu_tile.dart';


class SettingsInfoPage extends StatelessWidget {
  const SettingsInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF8FCFA),
      body: SafeArea(
        child: Column(
          children: [
            SettingsAppBar(title: '내 정보'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                children: [
                  SettingsMenuTile(
                    title: '프로필',
                  ),
                  SettingsMenuTile(
                    title: '로그아웃',
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