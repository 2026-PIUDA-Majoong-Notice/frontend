import 'package:flutter/material.dart';

import '../data/onboarding_pages.dart';


/// 온보딩 화면의 페이지 이동 상태와 관련 로직을 관리합니다.
class OnboardingViewModel extends ChangeNotifier {
  final PageController pageController = PageController();

  int currentIndex = 0;

  final pages = onboardingPages;

  bool get isLastPage => currentIndex == pages.length - 1;

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void next() {
    if (!isLastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      // TODO: 온보딩 완료 처리, 라우팅
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}