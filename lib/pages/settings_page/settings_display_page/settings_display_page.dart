import 'package:flutter/material.dart';

import '../widgets/settings_app_bar.dart';
import '../widgets/settings_menu_tile.dart';
import 'widgets/settings_display_font_tile.dart';


class SettingsDisplayPage extends StatefulWidget {
  const SettingsDisplayPage({super.key});

  @override
  State<SettingsDisplayPage> createState() => _SettingsDisplayPageState();
}

class _SettingsDisplayPageState extends State<SettingsDisplayPage> {
  bool isLargeText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FCFA),
      body: SafeArea(
        child: Column(
          children: [
            const SettingsAppBar(title: '화면 설정'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                children: [
                  SettingsFontSizeTile(
                    isLargeText: isLargeText,
                    onChanged: (value) {
                      setState(() {
                        isLargeText = value;
                      });
                    },
                  ),
                  const SettingsMenuTile(
                    title: '시간 표시 방식',
                  ),
                  const SettingsMenuTile(
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