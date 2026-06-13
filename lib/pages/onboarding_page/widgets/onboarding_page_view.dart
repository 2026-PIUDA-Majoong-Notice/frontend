import 'package:flutter/material.dart';

import '../model/onboarding_page_data.dart';


/// 온보딩 페이지 한 장의 이미지, 제목, 설명 UI를 구성합니다.
class OnboardingPageView extends StatelessWidget {
  final OnboardingPageData data;

  const OnboardingPageView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: data.title.map((title) {
                return TextSpan(
                  text: title.text,
                  style: TextStyle(
                    fontSize: 22,
                    color: title.color,
                    fontFamily: 'SCDream',
                    fontWeight: FontWeight.w600,
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 30),

          Image.asset(
            data.imagePath,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 40),

          Text(
            data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xff26332F),
              fontFamily: 'SCDream',
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}