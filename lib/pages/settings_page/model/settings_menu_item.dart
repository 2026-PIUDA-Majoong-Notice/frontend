import 'package:flutter/material.dart';


class SettingsMenuItem {
  final String title;
  final VoidCallback? onTap;

  const SettingsMenuItem({
    required this.title,
    this.onTap,
  });
}