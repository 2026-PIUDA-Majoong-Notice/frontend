import 'package:flutter/material.dart';

import '../model/onboarding_page_data.dart';


/// 온보딩 화면에 표시할 페이지별 이미지, 제목, 설명 데이터를 정의합니다.
final onboardingPages = [
  OnboardingPageData(
    imagePath: 'assets/images/onboarding_1.png',
    title: [
      OnboardingTextSpanData(
        text: '어르신의 하루를\n',
        color: const Color(0xff26332F),
      ),
      OnboardingTextSpanData(
        text: '더 세심하게 ',
        color: Color(0xff6FAF9B),
      ),
      OnboardingTextSpanData(
        text: '살펴요',
        color: Color(0xff26332F),
      ),
    ],
    description: '노티스는 어르신의 생활 리듬을 기록하고,\n보호자가 필요한 케어 타이밍을\n놓치지 않도록 도와줍니다.',
  ),

  OnboardingPageData(
    imagePath: 'assets/images/onboarding_2.png',
    title: [
      OnboardingTextSpanData(
        text: '용변 케어가 필요한\n',
        color: Color(0xff26332F),
      ),
      OnboardingTextSpanData(
        text: '시간을 미리 알려드려요',
        color: Color(0xff6FAF9B),
      ),
    ],
    description: '식사, 수분 섭취, 약 복용, 활동량,\n이전 용변 기록을 바탕으로\n오늘의 용변 가능 시간대를\n예측합니다.',
  ),

  OnboardingPageData(
    imagePath: 'assets/images/onboarding_3.png',
    title: [
      OnboardingTextSpanData(
        text: '기록할수록\n',
        color: Color(0xff26332F),
      ),
      OnboardingTextSpanData(
        text: '더 맞춤형',
        color: Color(0xff6FAF9B),
      ),
      OnboardingTextSpanData(
        text: '으로 관리해요',
        color: Color(0xff26332F),
      ),
    ],
    description: '케어 결과를 기록하면 어르신별 생활\n패턴을 더 잘 파악할 수 있어요.\n추천 시간 알림으로 확인이 필요한\n순간을 놓치지 마세요.',
  ),
];