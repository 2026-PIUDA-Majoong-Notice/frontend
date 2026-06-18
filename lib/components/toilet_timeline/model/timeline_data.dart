class TimelineSlot {
  final double time;      // 12.0, 12.5 , 30분 단위
  final int probability;  // 0 - 100 확률

  TimelineSlot({required this.time, required this.probability});
}

class TimelineData {
  final List<TimelineSlot> slots;  // 48개

  TimelineData({required this.slots});

  factory TimelineData.dummy() {
    return TimelineData(
      slots: List.generate(48, (i) {
        final time = i * 0.5;

        int prob = 20;
        if (time >= 7 && time <= 8) prob = 75;
        if (time >= 14 && time <= 15) prob = 85;  // 이때만 확률 높게 테스트 데이터 만들기
        return TimelineSlot(time: time, probability: prob);
      }),
    );
  }
}