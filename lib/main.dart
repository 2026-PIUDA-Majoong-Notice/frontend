import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majoong_notice/pages/home_page/widgets/home_page.dart';

import 'components/bottom_navi_bar.dart';
import 'pages/onboarding_page/onboarding_page.dart';

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
      home: const HomePage(),
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
      bottomNavigationBar: BottomNaviBar(currentIndex: 0,),
    );
  }
}
