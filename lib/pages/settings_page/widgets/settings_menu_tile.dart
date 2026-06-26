import 'package:flutter/material.dart';


class SettingsMenuTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool showDivider;

  const SettingsMenuTile({
    super.key,
    required this.title,
    this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'SCDream',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff26332F),
                  ),
                ),
              ],
            ),
          ),
          if (showDivider)
            const Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 350,
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0x2226332F),
                ),
              ),
            ),
        ],
      ),
    );
  }
}