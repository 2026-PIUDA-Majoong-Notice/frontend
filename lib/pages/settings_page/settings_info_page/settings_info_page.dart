import 'package:flutter/material.dart';

import '../widgets/settings_app_bar.dart';

class SettingsInfoPage extends StatelessWidget {
  const SettingsInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FCFA),
      body: SafeArea(
        child: Column(
          children: [
            const SettingsAppBar(title: '내 정보'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 92,
                        child: Text(
                          '프로필',
                          style: TextStyle(
                            fontFamily: 'SCDream',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff26332F),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 46,
                                  child: Text(
                                    '이름',
                                    style: TextStyle(
                                      fontFamily: 'SCDream',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff26332F),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '박성연',
                                    style: TextStyle(
                                      fontFamily: 'SCDream',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff26332F),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                SizedBox(
                                  width: 46,
                                  child: Text(
                                    '메일',
                                    style: TextStyle(
                                      fontFamily: 'SCDream',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff26332F),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '0504sypark@naver.com',
                                    style: TextStyle(
                                      fontFamily: 'SCDream',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff26332F),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0x2226332F),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        /// TODO: 로그아웃 동작
                      },
                      behavior: HitTestBehavior.opaque,
                      child: const Text(
                        '로그아웃',
                        style: TextStyle(
                          fontFamily: 'SCDream',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffD96B6B),
                        ),
                      ),
                    ),
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