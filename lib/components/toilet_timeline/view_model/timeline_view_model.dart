import 'package:flutter/material.dart';
import 'package:majoong_notice/components/toilet_timeline/model/timeline_data.dart';

class TimelineViewModel extends ChangeNotifier {
  TimelineData data;

  TimelineViewModel({required this.data});

  Color colorForProbability(int probability) {
    if (probability < 40) return const Color(0xFFC9DCFF);
    if (probability < 70) return const Color(0xFFFDBE72);
    return const Color(0xFFD96B6B);
  }
}