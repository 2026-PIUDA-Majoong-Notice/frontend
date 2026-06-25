import 'package:flutter/material.dart';


class SelectableRecordTypeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableRecordTypeButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? const Color(0xffDDEEE7)
        : const Color(0xffDDE0DF);

    final iconColor = isSelected
        ? const Color(0xff6FAF9B)
        : const Color(0x3326332F);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            width: 110,
            height: 110,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            child: Icon(
              icon,
              size: 52,
              color: iconColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'SCDream',
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Color(0xff26332F),
            ),
          ),
        ],
      ),
    );
  }
}