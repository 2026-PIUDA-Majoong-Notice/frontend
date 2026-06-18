import 'package:flutter/material.dart';
import 'package:majoong_notice/components/profile_card/widgets/profile_card.dart';
import 'package:majoong_notice/components/bottom_navi_bar.dart';
import 'package:majoong_notice/components/profile_card/model/profile_card_data.dart';
import 'package:majoong_notice/components/profile_card/view_model/profile_card_view_model.dart';
import 'package:majoong_notice/components/toilet_timeline/model/timeline_data.dart';
import 'package:majoong_notice/components/toilet_timeline/view_model/timeline_view_model.dart';
import 'package:majoong_notice/components/toilet_timeline/widgets/toilet_timeline.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    final viewModel = ProfileCardViewModel(data: ProfileCardData.dummy());
    final timeLineViewModel = TimelineViewModel(data: TimelineData.dummy());

    return Scaffold(body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(

          children: [
            const SizedBox(height: 50,),
            ProfileCard(data: viewModel,),
            const SizedBox(height: 20,),
            ToiletTimeline(viewModel: timeLineViewModel)
          ],
        ),
      ),
    ),
    bottomNavigationBar: const BottomNaviBar(),);
  }
}
