import 'package:flutter/material.dart';


enum RecordAddType {
  toilet,
  water,
  meal,
  sleep,
  medicine,
}

extension RecordAddTypeX on RecordAddType {
  String get label {
    switch (this) {
      case RecordAddType.toilet:
        return '용변';
      case RecordAddType.water:
        return '수분';
      case RecordAddType.meal:
        return '식사';
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
      case RecordAddType.water:
        return Icons.water_drop;
      case RecordAddType.meal:
        return Icons.fastfood_rounded;
      case RecordAddType.sleep:
        return Icons.nightlight_round;
      case RecordAddType.medicine:
        return Icons.medication;
    }
  }
}