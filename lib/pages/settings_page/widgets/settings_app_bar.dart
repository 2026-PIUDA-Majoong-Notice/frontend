import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SettingsAppBar extends StatelessWidget {
  final String title;

  const SettingsAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: Get.back,
              behavior: HitTestBehavior.opaque,
              child: const SizedBox(
                width: 44,
                height: 44,
                child: Icon(
                  Icons.chevron_left,
                  size: 34,
                  color: Color(0xff26332F),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'SCDream',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff26332F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}