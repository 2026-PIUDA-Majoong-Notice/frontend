import 'package:flutter/material.dart';


enum RecordAddType {
  toilet,
  mealWater,
  sleep,
  medicine,
}

extension RecordAddTypeX on RecordAddType {
  String get label {
    switch (this) {
      case RecordAddType.toilet:
        return '용변';
      case RecordAddType.mealWater:
        return '식사 / 수분';
      case RecordAddType.sleep:
        return '수면';
      case RecordAddType.medicine:
        return '약';
    }
  }

  IconData get icon {
    switch (this) {
      case RecordAddType.toilet:
        return Icons.wc;
      case RecordAddType.mealWater:
        return Icons.water_drop;
      case RecordAddType.sleep:
        return Icons.nightlight_round;
      case RecordAddType.medicine:
        return Icons.medication;
    }
  }
}