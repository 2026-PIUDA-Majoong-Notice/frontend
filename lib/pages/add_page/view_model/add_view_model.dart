import 'package:flutter/material.dart';


class AddViewModel extends ChangeNotifier {
  int currentPage = 0;

  String name = '';
  String? gender;
  String birthDate = '';
  TimeOfDay? wakeUpTime;
  TimeOfDay? bedtime;

  bool? usesDiaper;
  String? bowelPattern;
  String? mobility;
  String? cognition;

  String medicineKeyword = '';
  final Set<String> ironTimes = {};
  final Set<String> antacidTimes = {};

  void updateName(String value) {
    name = value;
    notifyListeners();
  }

  void updateGender(String value) {
    gender = value;
    notifyListeners();
  }

  void updateWakeUpTime(TimeOfDay value) {
    wakeUpTime = value;
    notifyListeners();
  }

  Future<void> submitBasicInfo() async {
    /// 기본 정보 서버 전송 or 검증
  }

  Future<void> submitAll() async {
    /// 최종 완료 API
  }
}