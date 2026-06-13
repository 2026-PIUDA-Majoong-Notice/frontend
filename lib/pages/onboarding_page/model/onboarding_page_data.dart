import 'package:flutter/material.dart';


/// 온보딩 페이지 하나를 구성하는 데이터 모델을 정의합니다.
class OnboardingPageData {
  final String imagePath;
  final List<OnboardingTextSpanData> title;
  final String description;

  const OnboardingPageData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

class OnboardingTextSpanData {
  final String text;
  final Color color;

  OnboardingTextSpanData({
    required this.text,
    required this.color,
  });
}