import 'package:flutter/material.dart';
import 'package:majoong_notice/components/profile_card/widgets/profile_card.dart';
import 'package:majoong_notice/components/bottom_navi_bar.dart';
import 'package:majoong_notice/components/profile_card/model/profile_card_data.dart';
import 'package:majoong_notice/components/profile_card/view_model/profile_card_view_model.dart';
import 'package:majoong_notice/model/elder.dart';
import 'package:majoong_notice/pages/home_page/widgets/elder_detail_page.dart';
import 'package:majoong_notice/pages/home_page/widgets/elder_detail_view.dart';
import 'package:majoong_notice/services/http/elder/get_elders.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Elder>> _eldersFuture;

  @override
  void initState() {
    super.initState();
    _eldersFuture = getElders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder<List<Elder>>(
              future: _eldersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      '어르신 목록을 불러오지 못했어요.',
                      style: TextStyle(fontFamily: 'SCDream', fontSize: 15),
                    ),
                  );
                }

                final elders = snapshot.data ?? [];

                if (elders.isEmpty) {
                  return const _EmptyEldersView();
                }

                if (elders.length == 1) {
                  return ElderDetailView(elder: elders.first);
                }

                return _ElderListView(elders: elders);
              },
            ),
            Positioned(
              top: 15,
              right: 27,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFDDEEE7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // TODO: 어르신 추가 페이지 이동
                      },
                      child: Image.asset(
                        'assets/images/icon_add_person.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        // TODO: 알림 끄기/켜기
                      },
                      child: Image.asset(
                        'assets/images/icon_alarm.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
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

class _EmptyEldersView extends StatelessWidget {
  const _EmptyEldersView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '등록된 어르신이 없어요.\n어르신을 등록하고 시작해보세요.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'SCDream',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF26332F),
        ),
      ),
    );
  }
}

class _ElderListView extends StatelessWidget {
  final List<Elder> elders;

  const _ElderListView({required this.elders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 50),
      itemCount: elders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final elder = elders[index];
        final viewModel = ProfileCardViewModel(data: ProfileCardData.fromElder(elder));
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ElderDetailPage(elder: elder)),
            );
          },
          child: ProfileCard(data: viewModel),
        );
      },
    );
  }
}
