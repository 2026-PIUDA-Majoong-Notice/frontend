import 'package:flutter/material.dart';
import 'components/bottom_navi_bar.dart';

void main() {
  runApp(const NoticeApp());
}

class NoticeApp extends StatelessWidget {
  const NoticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Notice(),
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
    return Scaffold(
      body: Center(
        child: Text('메인화면'),
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }
}
