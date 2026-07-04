import 'package:flutter/material.dart';
import 'package:majoong_notice/components/elder_status_card/widgets/status_Card.dart';
import 'package:majoong_notice/components/profile_card/model/profile_card_data.dart';
import 'package:majoong_notice/components/profile_card/view_model/profile_card_view_model.dart';
import 'package:majoong_notice/components/profile_card/widgets/profile_card.dart';
import 'package:majoong_notice/components/toilet_timeline/model/timeline_data.dart';
import 'package:majoong_notice/components/toilet_timeline/view_model/timeline_view_model.dart';
import 'package:majoong_notice/components/toilet_timeline/widgets/toilet_timeline.dart';
import 'package:majoong_notice/model/elder.dart';

class ElderDetailView extends StatelessWidget {
  final Elder elder;

  const ElderDetailView({super.key, required this.elder});


  @override
  Widget build(BuildContext context) {
    final viewModel = ProfileCardViewModel(data: ProfileCardData.fromElder(elder));
    final timeLineViewModel = TimelineViewModel(data: TimelineData.dummy());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 70),
            SizedBox(
              width: 326,
              height: 133,
              child: ProfileCard(data: viewModel),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 326,
              height: 342,
              child: ToiletTimeline(viewModel: timeLineViewModel),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: 326,
              height: 144,
              child: StatusCard(),
            ),
          ],
        ),
      ),
    );
  }
}
