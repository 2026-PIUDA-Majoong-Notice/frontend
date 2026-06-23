import 'package:flutter/material.dart';
import 'package:majoong_notice/components/toilet_timeline/model/timeline_data.dart';

class TimelineViewModel extends ChangeNotifier {
  TimelineData data;

  TimelineViewModel({required this.data});

  Color colorForProbability(int probability) {
    if (probability < 40) return const Color(0xFFC9DCFF).withOpacity(0.8);
    if (probability < 70) return const Color(0xFFFDBE72).withOpacity(0.8);
    return const Color(0xFFD96B6B).withOpacity(0.8);
  }

  String _formatTime(double time) {
    final hour = time.floor();
    final minute = (time - hour) == 0.5 ? '30' : '00';
    return '${hour.toString().padLeft(2, '0')}:$minute';
  }

  String? nextRiskPeriod() {
    final now = DateTime.now();
    final currentTimeSlot = ((now.hour + (now.minute >= 30 ? 0.5 : 0.0))* 2).toInt();


    TimelineSlot? endSlot,startSlot;

    for(int i = currentTimeSlot; i < 48;i++){
      if(data.slots[i].probability > 40 ){
        startSlot ??= data.slots[i];
        endSlot = data.slots[i];

        if(i == 47){
          if(startSlot == endSlot){
            String nextRiskTime = _formatTime(startSlot.time);
            return nextRiskTime;
          }
          String nextRiskTime = "${_formatTime(startSlot.time)} ~ ${_formatTime(endSlot.time)}";
          return nextRiskTime;
        }


      } else if(endSlot != null) {
        if(startSlot == endSlot){
          String nextRiskTime = _formatTime(startSlot!.time);
          return nextRiskTime;
        }
        String nextRiskTime = "${_formatTime(startSlot!.time)} ~ ${_formatTime(endSlot.time)}";
        return nextRiskTime;

      };
    }
    return "-";

  }
}