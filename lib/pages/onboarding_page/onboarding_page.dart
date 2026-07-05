import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:majoong_notice/pages/auth/widgets/login_page.dart';
import 'package:majoong_notice/pages/home_page/widgets/home_page.dart';

import 'view_model/onboarding_view_model.dart';
import 'widgets/onboarding_page_view.dart';
import 'widgets/onboarding_indicator.dart';


/// 온보딩 전체 화면의 구조와 페이지뷰, 버튼, 인디케이터를 구성합니다.
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final OnboardingViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = OnboardingViewModel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      viewModel.onPageChanged(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = viewModel.currentIndex == viewModel.pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: viewModel.pageController,
                itemCount: viewModel.pages.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (_, index) {
                  return OnboardingPageView(
                    data: viewModel.pages[index],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 5,
              ),
              child: SizedBox(
                height: 32,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: OnboardingIndicator(
                        currentIndex: viewModel.currentIndex,
                        itemCount: viewModel.pages.length,
                      ),
                    ),

                    if (isLastPage)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            //Get.to(() => AddPageMedicine()),
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            '시작하기',
                            style: TextStyle(
                              fontFamily: 'SCDream',
                              fontWeight: FontWeight.w300,
                              color: Color(0xff6FAF9B),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}