

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

  factory ProfileCardData.dummy() {  // 일단 더미데이터 임시로 만둘어놔써요
    return ProfileCardData(
      name: '김현수',
      time: DateTime.now().subtract(Duration(hours: 1)),
      toiletProbability: 24,
      tags: ['거동불가', '인지저하', '기저귀 착용'],
      lastToiletTime: DateTime.now().subtract(Duration(hours: 1)),
    );
  }
}









