import 'package:majoong_notice/model/elder.dart';

class ProfileCardData {
  final String name;
  final DateTime time;
  final int toiletProbability;
  final List<String> tags;
  final DateTime lastToiletTime;

  ProfileCardData({
  required this.name,
  required this.time,
  required this.toiletProbability,
  required this.tags,
  required this.lastToiletTime,
  });

  factory ProfileCardData.dummy() {  // 일단 더미데이터 임시
    return ProfileCardData(
      name: '김현수',
      time: DateTime.now().subtract(Duration(hours: 1)),
      toiletProbability: 24,
      tags: ['거동불가', '인지저하', '기저귀 착용'],
      lastToiletTime: DateTime.now().subtract(Duration(hours: 1)),
    );
  }

  factory ProfileCardData.fromElder(Elder elder) {
    return ProfileCardData(
      name: elder.name,
      time: DateTime.now(), // 용변 예측 API 연결 전까지 임시값
      toiletProbability: 0, // 용변 예측 API 연결 전까지 임시값
      tags: _tagsFromElder(elder),
      lastToiletTime: DateTime.now(), // 용변 타임라인 API 연결 전까지 임시값
    );
  }

  static List<String> _tagsFromElder(Elder elder) {
    final tags = <String>[];

    switch (elder.mobilityLevel) {
      case 'BEDRIDDEN':
        tags.add('거동불가');
        break;
      case 'NEEDS_ASSISTANCE':
        tags.add('부축 필요');
        break;
      case 'WALKING_AID':
        tags.add('보조기구 사용');
        break;
    }

    switch (elder.cognitiveStatus) {
      case 'MILD_IMPAIRMENT':
      case 'SEVERE_IMPAIRMENT':
        tags.add('인지저하');
        break;
    }

    if (elder.usesDiaper) {
      tags.add('기저귀 착용');
    }

    return tags;
  }
}









