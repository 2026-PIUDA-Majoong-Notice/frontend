import 'package:flutter/material.dart';


class CognitionStatusOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const CognitionStatusOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        width: 350,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffE5F3EE) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xff6FAF9B)
                : const Color(0xffD9DEDB),
            width: isSelected ? 1.4 : 1,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 92,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'SCDream',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                  color: Color(0xff26332F),
                ),
              ),
            ),
            Container(
              width: 1,
              height: 36,
              color: const Color(0xffD9DEDB),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'SCDream',
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  height: 1.2,
                  color: Color(0xff26332F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}