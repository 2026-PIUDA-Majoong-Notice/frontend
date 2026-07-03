import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoading() {
  if (Get.isDialogOpen ?? false) return;
  Get.dialog(
    const Center(
      child: CircularProgressIndicator(color: Color(0xFF6FAF9B)),
    ),
    barrierDismissible: false,
  );
}

void hideLoading() {
  if (Get.isDialogOpen ?? false) {
    Get.back();
  }
}
