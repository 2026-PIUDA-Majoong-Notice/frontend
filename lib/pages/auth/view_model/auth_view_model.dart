import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier { // 검증 로직을 설계
  String? validateEmail(String? value){//이메일 검증 로직
    if(value == null || value.isEmpty){
      return '이메일을 입력해주세요.';
    }

    final emailRegex = RegExp(r'^.+@.+\..+$');

    if (!emailRegex.hasMatch(value)) {
      return '올바른 이메일 형식이 아닙니다';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요';
    } // 일단 입력만

    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return '성함을 입력해주세요';
    } // 일단 입력만

    return null;
  }

  String? validatePasswordConfirm(String? value, String password) { //비밀번호 확인
    if (value == null || value.isEmpty) {
      return '비밀번호를 다시 입력해주세요';
    }
    if (value != password) {
      return '비밀번호가 일치하지 않습니다';
    }
    return null;
  }
}