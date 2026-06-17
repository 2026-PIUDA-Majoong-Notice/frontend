import 'package:flutter/cupertino.dart';
import 'package:majoong_notice/components/profile_card/model/profile_card_data.dart';


//해당 시간 용변 가능성에 따라 변경상태 저장
class ProfileCardViewModel extends ChangeNotifier {
  ProfileCardData data;

  ProfileCardViewModel({required this.data});

  int probablityLevel() {
    if (data.toiletProbability < 40) return 0;
    if (data.toiletProbability < 70) return 1;
    return 2;
  }

  String probabilityImagePath() {
    if (data.toiletProbability < 40) return 'assets/images/emoji_low.png';
    if (data.toiletProbability < 70) return 'assets/images/emoji_mid.png';
    return 'assets/images/emoji_high.png';
  }

  int lastToiletTime() {
    return DateTime.now().difference(data.lastToiletTime).inHours;
  }




}