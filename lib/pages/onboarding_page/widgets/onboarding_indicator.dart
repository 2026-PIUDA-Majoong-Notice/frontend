import 'package:flutter/material.dart';


/// 현재 온보딩 페이지 위치를 보여주는 인디케이터 UI를 구성합니다.
class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const OnboardingIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        final isActive = currentIndex == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xff6FAF9B)
                : const Color(0xffDDEEE7),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
