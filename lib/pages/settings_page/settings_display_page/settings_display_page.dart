import 'package:flutter/material.dart';

import '../widgets/settings_app_bar.dart';
import '../widgets/settings_menu_tile.dart';


class SettingsDisplayPage extends StatelessWidget {
  const SettingsDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF8FCFA),
      body: SafeArea(
        child: Column(
          children: [
            SettingsAppBar(title: '화면 설정'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                children: [
                  SettingsMenuTile(
                    title: '글자 크기',
                  ),
                  SettingsMenuTile(
                    title: '시간 표시 방식',
                  ),
                  SettingsMenuTile(
                    title: '다크모드',
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