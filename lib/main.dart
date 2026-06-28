import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/bottom_navi_bar.dart';
import 'pages/onboarding_page/onboarding_page.dart';
import 'pages/add_page/add_page_basic/add_page_basic.dart';
import 'pages/record_page/record_page_main/record_page_main.dart';
import 'pages/settings_page/settings_page.dart';


void main() {
  runApp(const NoticeApp());
}

class NoticeApp extends StatelessWidget {
  const NoticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF6FAF8),
      ),
      home: RecordPageMain(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Notice extends StatefulWidget {
  const Notice({super.key});

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('메인화면'),
      ),
    );
  }
}
