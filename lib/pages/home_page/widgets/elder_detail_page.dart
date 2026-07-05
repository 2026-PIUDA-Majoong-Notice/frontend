import 'package:flutter/material.dart';
import 'package:majoong_notice/components/bottom_navi_bar.dart';
import 'package:majoong_notice/model/elder.dart';
import 'package:majoong_notice/pages/home_page/widgets/elder_detail_view.dart';

class ElderDetailPage extends StatelessWidget {
  final Elder elder;

  const ElderDetailPage({super.key, required this.elder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ElderDetailView(elder: elder),
            Positioned(
              top: 14,
              left: 16,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  '뒤로',
                  style: TextStyle(
                    fontFamily: 'SCDream',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF26332F),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(currentIndex: 0),
    );
  }
}
